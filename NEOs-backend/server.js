const express = require('express');
const cors = require('cors');
const app = express();
const PORT = process.env.PORT || 4008;


const admin = require('firebase-admin');
const serviceAccount = require('./config/virtual-orrery-firebase-adminsdk-6anyj-e814f9670f.json'); // Replace with the path to your service account JSON file

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

// admin.initializeApp({
//   credential: admin.credential.cert(serviceAccount),
//   databaseURL: 'https://virtual-orrery-default-rtdb.asia-southeast1.firebasedatabase.app' // Replace with your Firebase project URL
// });

const db = admin.firestore();


// Importing service functions from neoService.js
//const { fetchNEOsFromNASA, saveNEOsToFirestore } = require('./services/neoService');
// const path = require('path');
// const { fetchNEOsFromNASA, saveNEOsToFirestore } = require(path.resolve(__dirname, 'services/neoService'));

const path = require('path');
const { fetchNEOsFromNASA, saveNEOsToFirestore } = require(path.resolve(__dirname, 'services/neoService'));


app.use(cors()); // Allow all origins

// Importing the routes from the routes folder
const neoRoutes = require('./routes/neo');  

// Use the routes with a prefix
app.use('/api', neoRoutes);  // Prefix routes with /api


// Basic route for root path
app.get('/', (req, res) => {
  res.send('Welcome to the NEO backend!');
});

// Route to fetch and display NEOs directly from the server.js (optional; can be moved to routes)
app.get('/neos', async (req, res) => {
  try {
    const neos = await fetchNEOsFromNASA();
    // Optional: Save NEOs to Firestore
    await saveNEOsToFirestore(neos);
    res.json(neos); // Respond with the NEO data
  } catch (error) {
    res.status(500).send('Error fetching NEO data');
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
