# app/controllers/bookings_controller.rb
class Api::V1::BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    coach_id = params[:coach_id]
    time_slot = params[:booked_at]

    # Use the current date if the date is not provided
    current_date = Time.zone.now.to_date.to_s

    coach = Coach.find_by(id: coach_id)
    if coach.nil?
      render json: { error: 'Coach not found' }, status: :not_found and return
    end

    time_slot_with_date = "#{current_date} #{time_slot}"
    time_slot_utc = Time.zone.parse(time_slot_with_date)


    booking = coach.bookings.new(time_slot: time_slot_utc)
    if booking.save
      render json: { message: 'Booking created successfully' }, status: :created
    else
      render json: { error: booking.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
