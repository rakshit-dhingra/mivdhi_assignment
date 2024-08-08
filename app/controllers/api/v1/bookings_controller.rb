class Api::V1::BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    coach_id = params[:coach_id]
    time_slot = params[:booked_at]

    # Use the current date if the date is not provided
    Time.zone = params[:timezone]
    current_date = Time.zone.now.to_date.to_s

    coach = Coach.find_by(id: coach_id)
    if coach.nil?
      render json: { error: 'Coach not found' }, status: :not_found and return
    end

    time_slot_with_date = "#{current_date} #{time_slot}"
    time_slot_utc = Time.zone.parse(time_slot_with_date)

    unless valid_time_slot?(coach, time_slot_utc)
      render json: { error: 'Invalid time slot' }, status: :unprocessable_entity and return
    end
    booking = coach.bookings.new(time_slot: time_slot_utc, day_of_week: params[:day_of_week], timezone: params[:timezone])
    if booking.save
      render json: { message: 'Booking created successfully' }, status: :created
    else
      render json: { error: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def valid_time_slot?(coach, time_slot)
    availabilities = coach.coach_availabilities.select do |availability|
      availability_start = availability.available_at.change(year: 2000, month: 1, day: 1)
      availability_end = availability.available_until.change(year: 2000, month: 1, day: 1)
      availability_end += 1.day if availability_end < availability_start
      time_only = time_slot.change(year: 2000, month: 1, day: 1)
      time_only += 1.day if time_only < availability_start

      time_only.between?(availability_start, availability_end)
    end

    availabilities.any?
  end
end
