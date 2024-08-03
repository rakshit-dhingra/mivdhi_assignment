class Api::V1::AvailabilitiesController < ApplicationController
  def index
    coach = Coach.find(params[:coach_id])
    availabilities = coach.coach_availabilities
    render json: availabilities.map { |availability| format_availability(availability, coach.bookings) }
  end

  private

  def format_availability(availability, bookings)
    start_time = availability.available_at.in_time_zone(availability.available_at.time_zone)
    end_time = availability.available_until.in_time_zone(availability.available_until.time_zone)
    # Generate slots and check booking status
    slots = generate_time_slots(start_time, end_time).reject do |slot|
      booked?(slot, bookings)
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
      Time.zone.at(time)
    end
  end

  def booked?(time, bookings)
    bookings.any? do |booking|
      booking_time = booking.time_slot.in_time_zone(booking.time_slot.time_zone)
      # Compare only the time component of the datetime objects
      time.strftime('%H:%M') == booking_time.strftime('%H:%M')
    end
  end
end