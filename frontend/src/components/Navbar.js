import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { auth } from '../firebaseConfig';
import { onAuthStateChanged, signOut } from 'firebase/auth';
import '../App.css';

function Navbar() {
  const [user, setUser] = useState(null);
  const navigate = useNavigate();

  // Listen for login/logout changes
  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (currentUser) => {
      setUser(currentUser);
    });
    return () => unsubscribe(); // Cleanup
  }, []);

  const handleLogout = async () => {
    await signOut(auth);
    navigate('/');
  };

  return (
    <nav className="navbar">
      <div className="navbar-left">
        <Link to="/" className="nav-logo">Your Name</Link>
        <Link to="/" className="nav-link">Home</Link>
        <Link to="/galleries" className="nav-link">Galleries</Link>
        <Link to="/about" className="nav-link">About</Link>
        <Link to="/gear" className="nav-link">Gear</Link>
      </div>
      <div className="navbar-right">
        {user ? (
          // --- UPDATED: Show if LOGGED IN ---
          <>
            <Link to="/admin" className="nav-link">Admin</Link>
            <Link to="/mission-generator" className="nav-link">Generator</Link>
            <button onClick={handleLogout} className="nav-button">Logout</button>
            {/* NEW: Show profile picture */}
            {user.photoURL && (
              <img 
                src={user.photoURL} 
                alt="Profile" 
                className="nav-profile-pic" 
              />
            )}
          </>
        ) : (
          // --- Show if LOGGED OUT ---
          <Link to="/login" className="nav-link">Login</Link>
        )}
      </div>
    </nav>
  );
}

export default Navbar;