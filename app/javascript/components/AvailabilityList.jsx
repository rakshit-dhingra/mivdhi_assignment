// app/javascript/components/AvailabilityList.js
import React from 'react';
import BookingForm from './BookingForm';

const AvailabilityList = ({ availabilities }) => {
  return (
    <div>
      <h3>Availabilities</h3>
      {availabilities.map((availability, index) => (
        <div key={index}>
          <h4>{availability.day_of_week}</h4>
          <ul>
            {availability.time_slots.map((slot, index) => (
              <li key={index}>
                <BookingForm coachId={availability.coach_id} time={slot} />
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );
};

export default AvailabilityList;
