// Importing the functions needed from the SDKs
const { initializeApp } = require("firebase/app");
const { getFirestore } = require("firebase/firestore");

//Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyB5Z2DkFLM-UYkoYz34DVCWafM-b2gTWJU",
  authDomain: "virtual-orrery.firebaseapp.com",
  databaseURL: "https://virtual-orrery-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "virtual-orrery",
  storageBucket: "virtual-orrery.appspot.com",
  messagingSenderId: "1049059440872",
  appId: "1:1049059440872:web:74b0462096cfc5dc26315d",
  measurementId: "G-NY2R3QCFBD"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Initialize Firestore
const db = getFirestore(app);

module.exports = { db };
