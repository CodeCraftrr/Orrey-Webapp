const axios = require('axios'); //http req
const { getFirestore } = require('firebase-admin/firestore'); // Firestore setup

// Function to fetch NEOs from NASA API
// const fetchNEOsFromNASA = async () => {
//     try {
//         // Replace with actual NASA API URL and parameters
//         const response = await axios.get('https://api.nasa.gov/neo/rest/v1/feed', {
//             params: {
//                 api_key: 'DEMO_KEY', // have to rplace with actual API key -done
//             }
//         });
//         return response.data.near_earth_objects; // Adjust this according to actual API response structure
//     } catch (error) {
//         console.error('Error fetching NEOs from NASA:', error);
//         throw error;
//     }
// };

const fetchNEOsFromNASA = async () => {
    try {
      const apiKey = 'n5riW3ly77sz9JQNbOu3HvRz8l6sy1i7WDbKWcGW'; // Replace with your actual API key
      const response = await fetch(`https://api.nasa.gov/neo/rest/v1/feed?api_key=${apiKey}`); // Replace with the correct endpoint
      const data = await response.json();
  
      // Extract all NEOs from the object by iterating over the dates
      let allNEOs = [];
      for (const date in data.near_earth_objects) {
        if (Array.isArray(data.near_earth_objects[date])) {
          allNEOs = allNEOs.concat(data.near_earth_objects[date]);
        }
      }
  
      return allNEOs;
    } catch (error) {
      console.error('Error fetching NEOs from NASA:', error);
      throw new Error('Failed to fetch NEOs from NASA');
    }
  };
  
  



const { db } = require('../config/firebaseConfig');
const { collection, addDoc } = require('firebase/firestore');

// Function to save NEOs to Firestore without batch
const saveNEOsToFirestore = async (neos) => {
  try {
    const neoCollection = collection(db, 'NEO');  // Define Firestore collection
    for (const neo of neos) {  // Loop through NEO data
      await addDoc(neoCollection, neo);  // Add each NEO object to Firestore
    }
    console.log('NEOs successfully saved to Firestore!');
  } catch (error) {
    console.error('Error saving NEOs to Firestore:', error);
    throw error;
  }
};

//module.exports = { saveNEOsToFirestore };


// Function to save NEOs to Firestore
// const saveNEOsToFirestore = async (neos) => {
//   try {
//     const batch = db.batch();
//     neos.forEach(neo => {
//       const neoRef = db.collection('NEOs').doc(neo.id);
//       batch.set(neoRef, neo);
//     });
//     await batch.commit();
//     console.log('NEOs saved to Firestore');
//   } catch (error) {
//     console.error('Error saving NEOs to Firestore:', error);
//     throw new Error('Failed to save NEOs to Firestore');
//   }
// };

  

// module.exports = { fetchNEOsFromNASA, saveNEOsToFirestore };


// Function to save NEOs to Firestore
// const saveNEOsToFirestore = async (neos) => {
//     try {
//         const db = getFirestore(); // Initialize Firestore
//         const batch = db.batch();

//         neos.forEach((neo) => {
//             const docRef = db.collection('neos').doc(neo.id); 
//             batch.set(docRef, neo);
//         });

//         await batch.commit();
//         console.log('NEOs saved to Firestore successfully!');
//     } catch (error) {
//         console.error('Error saving NEOs to Firestore:', error);
//         throw error;
//     }
// };

// // Export the service functions
module.exports = { fetchNEOsFromNASA, saveNEOsToFirestore };
