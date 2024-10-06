const express = require('express'); 
const { getNEOs } = require('../controllers/neoController'); // Import NEO controller

const router = express.Router();

// Route to fetch NEOs from NASA API
router.get('/', getNEOs);

module.exports = router;
