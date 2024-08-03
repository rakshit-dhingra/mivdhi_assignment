// app/javascript/components/CoachDetail.js
import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';
import AvailabilityList from './AvailabilityList';

const CoachDetail = () => {
  const { id } = useParams();
  const [coach, setCoach] = useState(null);
  const [availabilities, setAvailabilities] = useState([]);

  useEffect(() => {
    axios.get(`/coaches/${id}`).then(response => setCoach(response.data));
    axios.get(`/coaches/${id}/availabilities`).then(response => setAvailabilities(response.data));
  }, [id]);

  if (!coach) return <div>Loading...</div>;

  return (
    <div>
      <h1>{coach.name}</h1>
      <h2>{coach.timezone}</h2>
      <AvailabilityList availabilities={availabilities} />
    </div>
  );
};

export default CoachDetail;
