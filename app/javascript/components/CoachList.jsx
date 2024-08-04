import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './CoachList.css'; // Import the CSS file

const CoachList = () => {
  const [coaches, setCoaches] = useState([]);

  useEffect(() => {
    axios.get('/api/v1/coaches').then(response => setCoaches(response.data));
  }, []);

  return (
    <div className="coach-list">
      <h1>Coaches</h1>
      <ul>
        {coaches.map(coach => (
          <li key={coach.id}>
            <Link to={`/coaches/${coach.id}`}>{coach.name}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default CoachList;
