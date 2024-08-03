// app/javascript/components/CoachList.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';

const CoachList = () => {
  const [coaches, setCoaches] = useState([]);

  useEffect(() => {
    axios.get('/coaches').then(response => setCoaches(response.data));
  }, []);

  return (
    <div>
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
