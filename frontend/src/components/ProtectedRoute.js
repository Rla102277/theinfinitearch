import React, { useState, useEffect } from 'react';
import { auth } from '../firebaseConfig'; // <-- Note the '../'
import { onAuthStateChanged } from 'firebase/auth';
import { Navigate } from 'react-router-dom';

function ProtectedRoute({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (currentUser) => {
      setUser(currentUser);
      setLoading(false);
    });
    return () => unsubscribe();
  }, []);

  if (loading) {
    return <p>Loading authentication...</p>; // Or a spinner
  }

  if (!user) {
    // If not logged in, redirect to the /login page
    return <Navigate to="/login" replace />;
  }

  // If logged in, show the component we're protecting (e.g., Admin)
  return children;
}

export default ProtectedRoute;