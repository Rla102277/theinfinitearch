import React, { useState } from 'react';
// Import the new Google login tools
import { GoogleAuthProvider, signInWithPopup } from 'firebase/auth';
import { auth } from '../firebaseConfig';
import { useNavigate } from 'react-router-dom';
import '../App.css';

// Create a "provider" for Google
const provider = new GoogleAuthProvider();

function LoginPage() {
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  const handleGoogleLogin = async () => {
    setError(null);
    try {
      // 1. Show the Google Sign-in pop-up
      await signInWithPopup(auth, provider);
      
      // 2. On success, go to the admin page
      navigate('/admin');
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <div className="login-page-container">
      {/* We no longer need the <form> */}
      <div className="login-form">
        <h2>Admin Login</h2>
        <p>Please sign in with your Google account to access the admin dashboard.</p>
        <button 
          onClick={handleGoogleLogin} 
          className="google-login-button"
        >
          Sign in with Google
        </button>
        {error && <p className="error-message">{error}</p>}
      </div>
    </div>
  );
}

export default LoginPage;