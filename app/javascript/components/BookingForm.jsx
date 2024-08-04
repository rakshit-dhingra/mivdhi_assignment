// app/javascript/components/BookingForm.js
import React from 'react';
import axios from 'axios';
import './BookingForm.css';
import moment from 'moment-timezone';
import { toast } from 'react-toastify'; // Import the toast function from react-toastify
import 'react-toastify/dist/ReactToastify.css'; // Import the toast styles

// Initialize toast container in your main file (e.g., index.js or App.js)
// import { ToastContainer } from 'react-toastify';
// <ToastContainer />

const BookingForm = ({ coachId, time, day_of_week, onBookingConfirmed }) => {
  const handleBooking = () => {
    const booking = {
      coach_id: coachId,
      booked_at: time,
      day_of_week: day_of_week,
      timezone: moment.tz.guess(),
    };

    axios.post('/api/v1/bookings', booking)
      .then(response => {
        toast.success(`Confirmed booking for slot: ${time}!`);
        onBookingConfirmed(coachId, time, day_of_week);
      })
      .catch(error => {
         toast.error(`Error booking time slot: ${time}.`);
      });
  };

  return (
    <div className="booking-form">
      <span>{time}</span>
      <button onClick={handleBooking}>Book</button>
    </div>
  );
};

export default BookingForm;
