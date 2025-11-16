import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { GoogleGenerativeAI } from '@google/generative-ai'; // Import Gemini AI
import './MissionGenPage.css';

function MissionGenPage() {
  const [destination, setDestination] = useState('');
  const [duration, setDuration] = useState('');
  const [themes, setThemes] = useState('');
  const [generatedMission, setGeneratedMission] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  // Initialize Gemini AI client directly in the frontend
  const GEMINI_API_KEY = process.env.REACT_APP_GEMINI_API_KEY;
  const genAI = new GoogleGenerativeAI(GEMINI_API_KEY);
  const model = genAI.getGenerativeModel({ model: "gemini-pro" });

  const handleGenerateMission = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    setError(null);
    setGeneratedMission(null);

    if (!GEMINI_API_KEY) {
      setError("Gemini API Key is not set in .env file (REACT_APP_GEMINI_API_KEY).");
      setIsLoading(false);
      return;
    }

    const masterPrompt = `
      You are an expert travel photographer and creative director. Your task is to generate a compelling and structured photography mission scaffold.
      The output MUST be a valid JSON object with the following keys: "title", "description", "location", and "suggestedShots".
      - "title": A creative and engaging title for the mission.
      - "description": A one or two-sentence summary of the mission's theme and purpose.
      - "location": The primary location of the mission.
      - "suggestedShots": An array of at least 5 distinct and descriptive shot ideas.

      Example:
      {
        "title": "Iceland's Glacial Abstracts",
        "description": "A 5-day journey to capture the fleeting, abstract beauty of Iceland's glaciers and ice caves.",
        "location": "Jökulsárlón, Iceland",
        "suggestedShots": [
          "Close-up of volcanic ash trapped in blue glacial ice",
          "Wide-angle shot of icebergs on Diamond Beach at sunrise",
          "Long exposure of the glacial lagoon with moving ice",
          "Abstract patterns inside an ice cave with light play",
          "Telephoto compression of distant glacial tongues"
        ]
      }

      Now, generate a mission scaffold for a trip to: ${destination} for ${duration}, focusing on the themes of: ${themes}.
    `;

    try {
      const result = await model.generateContent(masterPrompt);
      const response = await result.response;
      const text = response.text();
      
      // Clean the response to ensure it's valid JSON
      const cleanedText = text.replace(/```json/g, '').replace(/```/g, '').trim();
      
      // Parse the JSON string into an object
      const missionData = JSON.parse(cleanedText);
      
      setGeneratedMission(missionData);

    } catch (err) {
      console.error("Error generating mission with Gemini AI directly:", err);
      setError("Failed to generate mission. Check your browser console for details and ensure your API key is correct.");
    } finally {
      setIsLoading(false);
    }
  };

  const handleUseAsDraft = () => {
    if (!generatedMission) return;
    // We use state to pass the generated data to the admin page
    navigate('/admin', { state: { newMissionDraft: generatedMission } });
  };

  return (
    <div className="mission-gen-container">
      <h1>AI Mission Generator</h1>
      <p>Spark your next photographic journey. Provide a few details and let the AI create a mission scaffold for you.</p>
      
      <form onSubmit={handleGenerateMission} className="mission-gen-form">
        <div className="form-group">
          <label htmlFor="destination">Destination</label>
          <input
            id="destination"
            type="text"
            value={destination}
            onChange={(e) => setDestination(e.target.value)}
            placeholder="e.g., Iceland, Kyoto, The Scottish Highlands"
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="duration">Duration</label>
          <input
            id="duration"
            type="text"
            value={duration}
            onChange={(e) => setDuration(e.target.value)}
            placeholder="e.g., 7 days, two weeks"
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="themes">Themes / Keywords</label>
          <input
            id="themes"
            type="text"
            value={themes}
            onChange={(e) => setThemes(e.target.value)}
            placeholder="e.g., winter, abstract, solitude, street photography"
            required
          />
        </div>
        <button type="submit" disabled={isLoading}>
          {isLoading ? 'Generating...' : 'Generate Mission'}
        </button>
      </form>

      {error && <div className="error-message">{error}</div>}

      {generatedMission && (
        <div className="generated-mission-card">
          <h2>{generatedMission.title}</h2>
          <p><strong>Location:</strong> {generatedMission.location}</p>
          <p><strong>Description:</strong> {generatedMission.description}</p>
          
          <h3>Suggested Shots:</h3>
          <ul>
            {generatedMission.suggestedShots.map((shot, index) => (
              <li key={index}>{shot}</li>
            ))}
          </ul>

          <button className="use-draft-button" onClick={handleUseAsDraft}>
            + Use this as a Draft in Admin
          </button>
        </div>
      )}
    </div>
  );
}

export default MissionGenPage;
