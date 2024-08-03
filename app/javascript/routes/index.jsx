import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import App from "../components/Index";

export default (
  <Router>
    <Routes>
      <Route path="/" element={<App />} />
    </Routes>
  </Router>
);