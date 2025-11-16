import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { db } from '../firebaseConfig';
import { doc, getDoc } from 'firebase/firestore';
import shopifyClient from '../shopifyClient'; // Corrected import
import './MissionDetailPage.css';

function MissionDetailPage() {
  const [mission, setMission] = useState(null);
  const [loading, setLoading] = useState(true);
  const { missionId } = useParams(); // Get missionId from the URL

  useEffect(() => {
    const fetchMission = async () => {
      if (!missionId) return;
      setLoading(true);
      // Reference a single document in the 'missions' collection
      const docRef = doc(db, 'missions', missionId);
      const docSnap = await getDoc(docRef);

      if (docSnap.exists()) {
        setMission({ id: docSnap.id, ...docSnap.data() });
      } else {
        console.log('No such document!');
        // Handle not found case, maybe redirect or show a message
      }
      setLoading(false);
    };

    fetchMission();
  }, [missionId]);

  // Function to initiate Shopify checkout
  const startCheckout = async (variantId) => {
    if (!variantId) {
      alert("This print is not available for purchase yet.");
      return;
    }
    try {
      const checkout = await shopifyClient.checkout.create();
      const lineItemsToAdd = [{
        variantId: variantId,
        quantity: 1,
      }];
      const updatedCheckout = await shopifyClient.checkout.addLineItems(checkout.id, lineItemsToAdd);
      window.location.href = updatedCheckout.webUrl; // Redirect to Shopify checkout
    } catch (error) {
      console.error("Error creating Shopify checkout:", error);
      alert("Could not initiate checkout. Please try again later.");
    }
  };

  if (loading) {
    return <div className="loading-container">Loading mission details...</div>;
  }

  if (!mission) {
    return <div className="not-found-container">Mission not found.</div>;
  }

  return (
    <div className="mission-detail-container">
      <header className="mission-header">
        <h1>{mission.title}</h1>
        <p className="mission-description">{mission.description}</p>
      </header>
      
      <div className="mission-photo-gallery">
        {mission.photos && mission.photos.map((photo, index) => (
          <div className="photo-entry" key={index}>
            <img src={photo.url} alt={photo.caption} />
            <div className="photo-details">
              <h2>{photo.caption}</h2>
              <p className="photo-story">{photo.story}</p>
              {/* Display EXIF data if it exists */}
              {photo.exif && (
                <div className="exif-data">
                  <strong>EXIF: </strong>
                  <span>{photo.exif.Model || ''}</span>
                  <span>{photo.exif.FNumber ? `f/${photo.exif.FNumber}` : ''}</span>
                  <span>{photo.exif.ExposureTime ? `1/${1/photo.exif.ExposureTime}s` : ''}</span>
                </div>
              )}
              {/* Shopify Buy Button */}
              {photo.shopifyId && (
                <button 
                  className="buy-print-btn" 
                  onClick={() => startCheckout(photo.shopifyId)}>
                  Buy Print
                </button>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default MissionDetailPage;
