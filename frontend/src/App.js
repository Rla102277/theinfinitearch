import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import AboutPage from './pages/AboutPage';
import GalleriesPage from './pages/GalleriesPage';
import GearPage from './pages/GearPage';
import MissionDetailPage from './pages/MissionDetailPage';
import LoginPage from './pages/LoginPage';
import Admin from './pages/Admin'; // Corrected import path for Admin
import ProtectedRoute from './components/ProtectedRoute';
import MissionGenPage from './pages/MissionGenPage'; // Import the new page
import './App.css';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/about" element={<AboutPage />} />
        <Route path="/galleries" element={<GalleriesPage />} />
        <Route path="/gear" element={<GearPage />} />
        <Route path="/mission/:missionId" element={<MissionDetailPage />} />
        <Route path="/login" element={<LoginPage />} />
        <Route path="/mission-generator" element={
          <ProtectedRoute>
            <MissionGenPage />
          </ProtectedRoute>
        } />
        {/* Protected Admin Route */}
        <Route path="/admin" element={
          <ProtectedRoute>
            <Admin />
          </ProtectedRoute>
        } />
      </Routes>
    </Router>
  );
}

export default App;
