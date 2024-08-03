// app/javascript/components/AvailabilityList.js
import React, { useState, useEffect } from 'react';
import BookingForm from './BookingForm';
import './AvailabilityList.css'; // Import the CSS file

const AvailabilityList = ({ initialAvailabilities = [] }) => {
  const [availabilities, setAvailabilities] = useState(initialAvailabilities);

  useEffect(() => {
    setAvailabilities(initialAvailabilities);
  }, [initialAvailabilities]);

  const handleBookingConfirmed = (coachId, time) => {
    setAvailabilities((prevAvailabilities) =>
      prevAvailabilities.map((availability) => {
        if (availability.coach_id === coachId) {
          return {
            ...availability,
            time_slots: availability.time_slots.filter((slot) => slot !== time),
          };
        }
        return availability;
      })
    );
  };

  return (
    <div className="availability-list">
      <h3>Availabilities</h3>
      {availabilities.length > 0 ? (
        availabilities.map((availability, index) => (
          <div key={index}>
            <h4>{availability.day_of_week}</h4>
            <div className="time-slot-container">
              {availability.time_slots.map((slot, index) => (
                <div key={index} className="time-slot">
                  <BookingForm
                    coachId={availability.coach_id}
                    time={slot}
                    onBookingConfirmed={handleBookingConfirmed}
                  />
                </div>
              ))}
            </div>
          </div>
        ))
      ) : (
        <p>No availabilities found.</p>
      )}
    </div>
  );
};

export default AvailabilityList;
