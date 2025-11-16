import React, { useState, useEffect } from 'react';
import { db, storage } from '../firebaseConfig';
import { collection, addDoc, getDocs, doc, updateDoc, deleteDoc, getDoc } from 'firebase/firestore';
import { ref, uploadBytes, getDownloadURL } from 'firebase/storage';
import axios from 'axios'; // For Cloudinary upload
import './Admin.css';

const CLOUDINARY_UPLOAD_PRESET = 'YOUR_CLOUDINARY_UPLOAD_PRESET'; // Replace with your preset
const CLOUDINARY_CLOUD_NAME = 'YOUR_CLOUDINARY_CLOUD_NAME';     // Replace with your cloud name

function Admin() {
  const [activeTab, setActiveTab] = useState('missions');
  const [missions, setMissions] = useState([]);
  const [gearItems, setGearItems] = useState([]);

  // Mission Form State
  const [currentMission, setCurrentMission] = useState(null);
  const [missionTitle, setMissionTitle] = useState('');
  const [missionDescription, setMissionDescription] = useState('');
  const [missionLocation, setMissionLocation] = useState('');
  const [missionStatus, setMissionStatus] = useState('draft');

  // Photo Form State (for adding/editing photos within a mission)
  const [photoFile, setPhotoFile] = useState(null);
  const [photoUrl, setPhotoUrl] = useState(''); // To display existing Cloudinary image
  const [photoCaption, setPhotoCaption] = useState('');
  const [photoStory, setPhotoStory] = useState('');
  const [photoShopifyId, setPhotoShopifyId] = useState('');
  const [showInGallery, setShowInGallery] = useState(false);
  const [exifData, setExifData] = useState({});
  const [editingPhotoIndex, setEditingPhotoIndex] = useState(null);

  // Gear Form State
  const [currentGearItem, setCurrentGearItem] = useState(null);
  const [gearName, setGearName] = useState('');
  const [gearCategory, setGearCategory] = useState('camera');
  const [gearDescription, setGearDescription] = useState('');
  const [gearLink, setGearLink] = useState('');

  useEffect(() => {
    fetchMissions();
    fetchGearItems();
  }, []);

  const fetchMissions = async () => {
    const querySnapshot = await getDocs(collection(db, 'missions'));
    setMissions(querySnapshot.docs.map(doc => ({ id: doc.id, ...doc.data() })));
  };

  const fetchGearItems = async () => {
    const querySnapshot = await getDocs(collection(db, 'gear'));
    setGearItems(querySnapshot.docs.map(doc => ({ id: doc.id, ...doc.data() })));
  };

  const resetMissionForm = () => {
    setCurrentMission(null);
    setMissionTitle('');
    setMissionDescription('');
    setMissionLocation('');
    setMissionStatus('draft');
    resetPhotoForm(); // Also reset photo form if it's tied to current mission
  };

  const resetPhotoForm = () => {
    setPhotoFile(null);
    setPhotoUrl('');
    setPhotoCaption('');
    setPhotoStory('');
    setPhotoShopifyId('');
    setShowInGallery(false);
    setExifData({});
    setEditingPhotoIndex(null);
  };

  const resetGearForm = () => {
    setCurrentGearItem(null);
    setGearName('');
    setGearCategory('camera');
    setGearDescription('');
    setGearLink('');
  };

  const handleMissionSubmit = async (e) => {
    e.preventDefault();
    const missionData = {
      title: missionTitle,
      description: missionDescription,
      location: missionLocation,
      status: missionStatus,
      photos: currentMission?.photos || [], // Keep existing photos if editing
    };

    try {
      if (currentMission) {
        const missionRef = doc(db, 'missions', currentMission.id);
        await updateDoc(missionRef, missionData);
        alert('Mission updated!');
      } else {
        await addDoc(collection(db, 'missions'), missionData);
        alert('Mission created!');
      }
      fetchMissions();
      resetMissionForm();
    } catch (error) {
      console.error("Error saving mission:", error);
      alert("Failed to save mission.");
    }
  };

  const handleEditMission = async (mission) => {
    setCurrentMission(mission);
    setMissionTitle(mission.title);
    setMissionDescription(mission.description);
    setMissionLocation(mission.location);
    setMissionStatus(mission.status);
    resetPhotoForm(); // Clear photo form when editing a new mission
  };

  const handleDeleteMission = async (id) => {
    if (window.confirm('Are you sure you want to delete this mission and all its photos?')) {
      try {
        await deleteDoc(doc(db, 'missions', id));
        alert('Mission deleted!');
        fetchMissions();
        resetMissionForm();
      } catch (error) {
        console.error("Error deleting mission:", error);
        alert("Failed to delete mission.");
      }
    }
  };

  const handlePhotoUpload = async (e) => {
    e.preventDefault();
    if (!photoFile && !photoUrl) {
      alert("Please select an image file or provide an existing URL.");
      return;
    }
    if (!currentMission) {
      alert("Please select or create a mission first.");
      return;
    }

    let imageUrl = photoUrl; // Use existing URL if provided

    // If a new file is selected, upload to Cloudinary
    if (photoFile) {
      const formData = new FormData();
      formData.append('file', photoFile);
      formData.append('upload_preset', CLOUDINARY_UPLOAD_PRESET);

      try {
        const response = await axios.post(
          `https://api.cloudinary.com/v1_1/${CLOUDINARY_CLOUD_NAME}/image/upload`,
          formData
        );
        imageUrl = response.data.secure_url;
      } catch (error) {
        console.error("Error uploading photo to Cloudinary:", error);
        alert("Failed to upload photo to Cloudinary.");
        return;
      }
    }

    const newPhoto = {
      url: imageUrl,
      caption: photoCaption,
      story: photoStory,
      shopifyId: photoShopifyId,
      showInGallery: showInGallery,
      exif: exifData,
    };

    const missionRef = doc(db, 'missions', currentMission.id);
    let updatedPhotos;
    if (editingPhotoIndex !== null) {
      updatedPhotos = [...currentMission.photos];
      updatedPhotos[editingPhotoIndex] = newPhoto;
    } else {
      updatedPhotos = [...(currentMission.photos || []), newPhoto];
    }

    try {
      await updateDoc(missionRef, { photos: updatedPhotos });
      alert('Photo saved to mission!');
      // Refresh current mission details to show new photo
      const updatedMissionSnap = await getDoc(missionRef);
      setCurrentMission({ id: updatedMissionSnap.id, ...updatedMissionSnap.data() });
      fetchMissions(); // Also refresh the mission list
      resetPhotoForm();
    } catch (error) {
      console.error("Error saving photo to Firestore:", error);
      alert("Failed to save photo to mission.");
    }
  };

  const handleEditPhoto = (photo, index) => {
    setEditingPhotoIndex(index);
    setPhotoUrl(photo.url);
    setPhotoCaption(photo.caption);
    setPhotoStory(photo.story);
    setPhotoShopifyId(photo.shopifyId);
    setShowInGallery(photo.showInGallery);
    setExifData(photo.exif || {});
    setPhotoFile(null); // Clear file input as URL is already set, unless user picks new one
  };

  const handleDeletePhoto = async (photoIndex) => {
    if (!currentMission || !currentMission.photos) return;
    if (window.confirm('Are you sure you want to delete this photo from the mission?')) {
      try {
        const updatedPhotos = currentMission.photos.filter((_, index) => index !== photoIndex);
        const missionRef = doc(db, 'missions', currentMission.id);
        await updateDoc(missionRef, { photos: updatedPhotos });
        alert('Photo deleted!');
        // Refresh current mission details
        const updatedMissionSnap = await getDoc(missionRef);
        setCurrentMission({ id: updatedMissionSnap.id, ...updatedMissionSnap.data() });
        fetchMissions(); // Also refresh the mission list
        resetPhotoForm();
      } catch (error) {
        console.error("Error deleting photo:", error);
        alert("Failed to delete photo.");
      }
    }
  };

  const handleGearSubmit = async (e) => {
    e.preventDefault();
    const gearData = {
      name: gearName,
      category: gearCategory,
      description: gearDescription,
      link: gearLink,
    };

    try {
      if (currentGearItem) {
        const gearRef = doc(db, 'gear', currentGearItem.id);
        await updateDoc(gearRef, gearData);
        alert('Gear item updated!');
      } else {
        await addDoc(collection(db, 'gear'), gearData);
        alert('Gear item created!');
      }
      fetchGearItems();
      resetGearForm();
    } catch (error) {
      console.error("Error saving gear item:", error);
      alert("Failed to save gear item.");
    }
  };

  const handleEditGear = (item) => {
    setCurrentGearItem(item);
    setGearName(item.name);
    setGearCategory(item.category);
    setGearDescription(item.description);
    setGearLink(item.link);
  };

  const handleDeleteGear = async (id) => {
    if (window.confirm('Are you sure you want to delete this gear item?')) {
      try {
        await deleteDoc(doc(db, 'gear', id));
        alert('Gear item deleted!');
        fetchGearItems();
        resetGearForm();
      } catch (error) {
        console.error("Error deleting gear item:", error);
        alert("Failed to delete gear item.");
      }
    }
  };

  return (
    <div className="admin-container">
      <h1>Admin Panel</h1>

      <div className="admin-tabs">
        <button
          className={`tab-button ${activeTab === 'missions' ? 'active' : ''}`}
          onClick={() => setActiveTab('missions')}
        >
          Manage Missions
        </button>
        <button
          className={`tab-button ${activeTab === 'gear' ? 'active' : ''}`}
          onClick={() => setActiveTab('gear')}
        >
          Manage Gear
        </button>
      </div>

      {activeTab === 'missions' && (
        <div className="tab-content">
          <h2>{currentMission ? 'Edit Mission' : 'Create New Mission'}</h2>
          <form onSubmit={handleMissionSubmit} className="admin-form">
            <input
              type="text"
              placeholder="Mission Title"
              value={missionTitle}
              onChange={(e) => setMissionTitle(e.target.value)}
              required
            />
            <textarea
              placeholder="Mission Description (supports markdown)"
              value={missionDescription}
              onChange={(e) => setMissionDescription(e.target.value)}
            ></textarea>
            <input
              type="text"
              placeholder="Mission Location"
              value={missionLocation}
              onChange={(e) => setMissionLocation(e.target.value)}
            />
            <select value={missionStatus} onChange={(e) => setMissionStatus(e.target.value)}>
              <option value="draft">Draft</option>
              <option value="published">Published</option>
            </select>
            <div className="form-actions">
              <button type="submit">{currentMission ? 'Update Mission' : 'Create Mission'}</button>
              {currentMission && <button type="button" onClick={resetMissionForm} className="cancel-button">Cancel</button>}
            </div>
          </form>

          <h3>Existing Missions</h3>
          <div className="item-list">
            {missions.map((mission) => (
              <div key={mission.id} className="item-card">
                <h4>{mission.title} ({mission.status})</h4>
                <p>{mission.location}</p>
                <div className="item-actions">
                  <button onClick={() => handleEditMission(mission)}>Edit</button>
                  <button onClick={() => handleDeleteMission(mission.id)} className="delete-button">Delete</button>
                </div>
              </div>
            ))}
          </div>

          {currentMission && (
            <div className="mission-photos-section">
              <h3>Photos for "{currentMission.title}"</h3>
              <form onSubmit={handlePhotoUpload} className="admin-form photo-form">
                <h4>{editingPhotoIndex !== null ? 'Edit Photo' : 'Add New Photo'}</h4>
                <input
                  type="file"
                  accept="image/*"
                  onChange={(e) => setPhotoFile(e.target.files[0])}
                />
                 {photoUrl && !photoFile && (
                  <div className="current-image-preview">
                    <img src={photoUrl} alt="Current" style={{ maxWidth: '200px', maxHeight: '200px' }} />
                    <p>Current Image</p>
                  </div>
                )}
                <input
                  type="text"
                  placeholder="Image URL (optional, if not uploading new file)"
                  value={photoUrl}
                  onChange={(e) => setPhotoUrl(e.target.value)}
                />
                <input
                  type="text"
                  placeholder="Caption"
                  value={photoCaption}
                  onChange={(e) => setPhotoCaption(e.target.value)}
                  required
                />
                <textarea
                  placeholder="Story behind the photo (supports markdown)"
                  value={photoStory}
                  onChange={(e) => setPhotoStory(e.target.value)}
                ></textarea>
                <input
                  type="text"
                  placeholder="Shopify Product Variant ID"
                  value={photoShopifyId}
                  onChange={(e) => setPhotoShopifyId(e.target.value)}
                />
                <label className="checkbox-label">
                  <input
                    type="checkbox"
                    checked={showInGallery}
                    onChange={(e) => setShowInGallery(e.target.checked)}
                  />
                  Show in Main Gallery
                </label>
                <button type="submit">{editingPhotoIndex !== null ? 'Update Photo' : 'Add Photo'}</button>
                {editingPhotoIndex !== null && <button type="button" onClick={resetPhotoForm} className="cancel-button">Cancel Edit</button>}
              </form>

              <h4>Existing Photos in Mission</h4>
              <div className="photo-list">
                {currentMission.photos && currentMission.photos.map((photo, index) => (
                  <div key={index} className="photo-item-card">
                    <img src={photo.url} alt={photo.caption} />
                    <div className="photo-item-details">
                      <h5>{photo.caption}</h5>
                      <p>Show in Gallery: {photo.showInGallery ? 'Yes' : 'No'}</p>
                      <p>Shopify ID: {photo.shopifyId || 'N/A'}</p>
                      <div className="item-actions">
                        <button onClick={() => handleEditPhoto(photo, index)}>Edit</button>
                        <button onClick={() => handleDeletePhoto(index)} className="delete-button">Delete</button>
                      </div>
                    </div>
                  </div>
                ))}
                 {(!currentMission.photos || currentMission.photos.length === 0) && (
                    <p>No photos added to this mission yet.</p>
                )}
              </div>
            </div>
          )}
        </div>
      )}

      {activeTab === 'gear' && (
        <div className="tab-content">
          <h2>{currentGearItem ? 'Edit Gear Item' : 'Create New Gear Item'}</h2>
          <form onSubmit={handleGearSubmit} className="admin-form">
            <input
              type="text"
              placeholder="Gear Item Name"
              value={gearName}
              onChange={(e) => setGearName(e.target.value)}
              required
            />
            <select value={gearCategory} onChange={(e) => setGearCategory(e.target.value)}>
              <option value="camera">Camera</option>
              <option value="lens">Lens</option>
              <option value="drone">Drone</option>
              <option value="accessory">Accessory</option>
            </select>
            <textarea
              placeholder="Description"
              value={gearDescription}
              onChange={(e) => setGearDescription(e.target.value)}
            ></textarea>
            <input
              type="text"
              placeholder="Purchase Link (URL)"
              value={gearLink}
              onChange={(e) => setGearLink(e.target.value)}
            />
            <div className="form-actions">
              <button type="submit">{currentGearItem ? 'Update Gear' : 'Add Gear'}</button>
              {currentGearItem && <button type="button" onClick={resetGearForm} className="cancel-button">Cancel</button>}
            </div>
          </form>

          <h3>Existing Gear Items</h3>
          <div className="item-list">
            {gearItems.map((item) => (
              <div key={item.id} className="item-card">
                <h4>{item.name} ({item.category})</h4>
                <p>{item.description}</p>
                <div className="item-actions">
                  <button onClick={() => handleEditGear(item)}>Edit</button>
                  <button onClick={() => handleDeleteGear(item.id)} className="delete-button">Delete</button>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

export default Admin;
