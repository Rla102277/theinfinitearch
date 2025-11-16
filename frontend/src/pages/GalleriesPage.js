import React, { useState, useEffect } from 'react';
import { db } from '../firebaseConfig';
import { collection, getDocs } from 'firebase/firestore';
import { Link } from 'react-router-dom';
import './GalleriesPage.css';

function GalleriesPage() {
  const [galleryImages, setGalleryImages] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchGalleryImages = async () => {
      setLoading(true);
      const missionsCollectionRef = collection(db, 'missions');
      const querySnapshot = await getDocs(missionsCollectionRef);
      
      const images = [];
      querySnapshot.forEach((doc) => {
        const mission = doc.data();
        // Ensure mission.photos exists and is an array
        if (mission.photos && Array.isArray(mission.photos)) {
          mission.photos.forEach(photo => {
            // Only add photos that are explicitly marked to be shown
            if (photo.showInGallery) {
              images.push({
                ...photo,
                missionId: doc.id, // Add missionId for linking
                missionTitle: mission.title // Add mission title for context
              });
            }
          });
        }
      });
      
      setGalleryImages(images);
      setLoading(false);
    };

    fetchGalleryImages();
  }, []);

  if (loading) {
    return <div className="loading-container">Loading galleries...</div>;
  }

  return (
    <div className="galleries-container">
      <h1>Master Gallery</h1>
      <p>A curated collection of photos from all missions.</p>
      <div className="photo-grid">
        {galleryImages.map((image, index) => (
          <Link to={`/mission/${image.missionId}`} className="photo-grid-item" key={index}>
            <img src={image.url} alt={image.caption} />
            <div className="photo-info">
              <p className="photo-caption">{image.caption}</p>
              <p className="mission-link">From: {image.missionTitle}</p>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
}

export default GalleriesPage;
