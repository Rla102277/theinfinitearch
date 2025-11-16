import React, { useState, useEffect } from 'react';
import { db } from '../firebaseConfig';
// --- NEW: Import 'deleteDoc' and 'doc' ---
import { collection, getDocs, query, orderBy, doc, deleteDoc } from 'firebase/firestore';
import '../App.css';
import '../components/Tiptap.css';

function GearPage() {
  const [gearList, setGearList] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // This function now fetches AND sets the gear
  const fetchGear = async () => {
    setLoading(true);
    setError(null);
    try {
      const gearRef = collection(db, "gear");
      const q = query(gearRef, orderBy("name", "asc"));
      
      const querySnapshot = await getDocs(q);
      const allGear = querySnapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data()
      }));
      
      setGearList(allGear);

    } catch (err) {
      console.error("Error fetching gear:", err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  // Fetch all gear from Firestore when the page loads
  useEffect(() => {
    fetchGear();
  }, []); // The empty array [] means this runs once on load

  
  // --- DELETE FUNCTION ---
  const handleDeleteGear = async (gearId, gearName) => {
    if (!window.confirm(`Are you sure you want to delete "${gearName}"?`)) {
      return;
    }

    try {
      // Create a reference to the specific gear document
      const gearDocRef = doc(db, "gear", gearId);
      // Delete it
      await deleteDoc(gearDocRef);
      
      // After deleting from Firestore, update our local state
      setGearList(prevGearList => 
        prevGearList.filter(gear => gear.id !== gearId)
      );
      
    } catch (err) {
      console.error("Error deleting gear:", err);
      setError("Could not delete gear item. " + err.message);
    }
  };


  if (loading) {
    return (
      <div className="App" style={{ color: 'white', height: '100vh' }}>
        <p>Loading Gear...</p>
      </div>
    );
  }

  return (
    <div className="App">
      <div className="output-container" style={{ height: 'auto', border: 'none', margin: 'auto' }}>
        <div className="article-content" style={{paddingTop: '3rem'}}>
          
          <h1>My Gear</h1>
          
          {/* --- THIS IS THE CORRECTED LINE --- */}
          <p style={{color: '#aaa', fontSize: '1.1rem', fontStyle: 'italic'}}>
            A curated list of the tools I use to create my images.
          </p>

          {error && (
            <div className="error-message-box">
              <p><strong>Error:</strong> {error}</p>
            </div>
          )}

          <div className="gear-list">
            {gearList.map(gear => (
              <div className="gear-item" key={gear.id}>
                
                <button 
                  onClick={() => handleDeleteGear(gear.id, gear.name)}
                  className="gear-delete-button"
                >
                  &times;
                </button>
                
                <h2>{gear.name}</h2>
                <div 
                  className="article-story-content ql-snow"
                >
                  <div 
                    className="ql-editor"
                    dangerouslySetInnerHTML={{ __html: gear.specsHtml }} 
                  />
                </div>
              </div>
            ))}
          </div>
          
        </div>
      </div>
    </div>
  );
}

export default GearPage;