const { fetchNEOsFromNASA, saveNEOsToFirestore } = require('../services/neoService');  // Import service functions

// Controller function to handle fetching and saving NEOs
const getNEOs = async (req, res) => {
  try {
    const neos = await fetchNEOsFromNASA();  // Fetch data from NASA API
    await saveNEOsToFirestore(neos);  // Save data to Firestore
    res.status(200).json({ success: true, data: neos });
  } catch (error) {
    console.error('Error fetching NEOs:', error);
    res.status(500).json({ success: false, message: 'Failed to fetch NEOs' });
  }
};

module.exports = { getNEOs };
