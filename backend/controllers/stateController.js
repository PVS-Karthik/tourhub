const stateModel = require('../models/stateModel');

async function getAllStates(req, res) {
  try {
    const states = await stateModel.getAllStates();
    res.json(states);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}

async function getStateById(req, res) {
  try {
    const state = await stateModel.getStateById(req.params.id);
    if (!state) {
      return res.status(404).json({ error: 'State not found' });
    }
    const places = await stateModel.getPlacesByStateId(req.params.id);
    for (let place of places) {
      place.details = await stateModel.getPlaceDetails(place.id);
    }
    state.places = places;
    res.json(state);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}

async function getStatesBySeason(req, res) {
  try {
    const states = await stateModel.getStatesBySeason(req.params.season);
    res.json(states);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}

async function searchPlaces(req, res) {
  try {
    const places = await stateModel.searchPlaces(req.query.q);
    res.json(places);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}

module.exports = {
  getAllStates,
  getStateById,
  getStatesBySeason,
  searchPlaces
};
