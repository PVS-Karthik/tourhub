const express = require('express');
const router = express.Router();
const controller = require('../controllers/stateController');

router.get('/', controller.getAllStates);
router.get('/season/:season', controller.getStatesBySeason);
router.get('/search', controller.searchPlaces);
router.get('/:id', controller.getStateById);

module.exports = router;
