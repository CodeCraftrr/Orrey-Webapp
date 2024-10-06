const express = require('express');

// Import the service functions for fetching and saving NEO data
//const { fetchNEOsFromNASA, saveNEOsToFirestore } = require('./services/neoService'); 
const { fetchNEOsFromNASA, saveNEOsToFirestore } = require('../services/neoService');


const router = express.Router();

// Route to fetch and display NEOs from NASA API
router.get('/fetch-neos', async (req, res) => {
  try {
    const neos = await fetchNEOsFromNASA(); // Fetch NEOs from the NASA API
    res.json(neos); // Respond with fetched NEOs in JSON format
  } catch (error) {
    console.error('Error fetching NEOs:', error); 
    res.status(500).send('Failed to fetch NEOs'); 
  }
});

// (Optional) Route to save NEOs to Firestore (if needed)
router.post('/save-neos', async (req, res) => {
  try {
    const neos = await fetchNEOsFromNASA(); // Fetch NEOs 
    await saveNEOsToFirestore(neos); // Save them to Firestore
    res.status(200).send('NEOs saved successfully');
  } catch (error) {
    console.error('Error saving NEOs:', error);
    res.status(500).send('Failed to save NEOs');
  }
});

module.exports = router;
