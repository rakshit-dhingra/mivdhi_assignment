// app/javascript/components/BookingForm.js
import React, { useState } from 'react';
import axios from 'axios';

const BookingForm = ({ coachId, time }) => {
  const [status, setStatus] = useState('');

  const handleBooking = () => {
    const booking = {
      coach_id: coachId,
      booked_at: time,
    };

    axios.post('/bookings', booking)
      .then(response => {
        setStatus('Booking confirmed!');
      })
      .catch(error => {
        setStatus('Error booking time slot.');
      });
  };

  return (
    <div>
      <span>{time}</span>
      <button onClick={handleBooking}>Book</button>
      {status && <p>{status}</p>}
    </div>
  );
};

export default BookingForm;
