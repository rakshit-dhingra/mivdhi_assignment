class Api::V1::AvailabilitiesController < ApplicationController
  def index
    coach = Coach.find(params[:coach_id])
    timezone = params[:timezone]
    availabilities = coach.coach_availabilities
    render json: availabilities.map { |availability| format_availability(availability, coach.bookings) }
  end

  private

  def format_availability(availability, bookings)
    start_time = availability.available_at
    end_time = availability.available_until
    slots = generate_time_slots(start_time, end_time).reject do |slot|
      booked?(slot, bookings,availability.day_of_week)
    end.map { |time| time.strftime('%H:%M') }
    {
      id: availability.id,
      coach_id: availability.coach_id,
      day_of_week: availability.day_of_week,
      available_at: availability.available_at.as_json,
      available_until: availability.available_until.as_json,
      time_slots: slots,
      booked: nil,
      created_at: availability.created_at.as_json
    }
  end

  def generate_time_slots(start_time, end_time)
    (start_time.to_i..end_time.to_i).step(30.minutes).map do |time|
      Time.zone.at(time).in_time_zone(params[:timezone])
    end
  end

  def booked?(time, bookings,day_of_week)
    bookings.any? do |booking|
      booking_time = booking.time_slot.in_time_zone(params[:timezone])
      # Compare only the time component of the datetime objects
      time.strftime('%H:%M') == booking_time.strftime('%H:%M') && day_of_week == booking.day_of_week
    end
  end
end