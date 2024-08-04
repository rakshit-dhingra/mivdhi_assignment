import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import CoachList from '../components/CoachList';
import CoachDetail from '../components/CoachDetail';
import { ToastContainer } from 'react-toastify'; 

const App = () => {
  return (
    <Router>
      <div>
        <Routes>
          <Route path="/" element={<CoachList />} />
          <Route path="/coaches/:id" element={<CoachDetail />} />
        </Routes>
        <ToastContainer /> {/* Add the ToastContainer here */}
      </div>
    </Router>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const root = ReactDOM.createRoot(document.body.appendChild(document.createElement('div')));
  root.render(<App />);
});
