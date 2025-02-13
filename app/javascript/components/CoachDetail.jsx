import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';
import moment from 'moment-timezone';
import AvailabilityList from './AvailabilityList';
import './CoachDetail.css'; // Import the CSS file

const CoachDetail = () => {
  const { id } = useParams();
  const [coach, setCoach] = useState(null);
  const [availabilities, setAvailabilities] = useState([]);

  useEffect(() => {
    axios.get(`/api/v1/coaches/${id}`).then(response => setCoach(response.data));
    axios.get(`/api/v1/coaches/${id}/availabilities?timezone=${moment.tz.guess()}`).then(response => setAvailabilities(response.data));
  }, [id]);

  if (!coach) return <div>Loading...</div>;

  return (
    <div className="coach-detail">
      <h1>{coach.name}</h1>
      <h2>{coach.timezone}</h2>
      <div className="availability-list">
        <AvailabilityList initialAvailabilities={availabilities} />
      </div>
    </div>
  );
};

export default CoachDetail;
