const db = require('../db');

async function getAllStates() {
  const [states] = await db.query('SELECT * FROM states');
  return states;
}

async function getStateById(id) {
  const [states] = await db.query('SELECT * FROM states WHERE id = ?', [id]);
  return states[0];
}

async function getStatesBySeason(season) {
  const [states] = await db.query('SELECT * FROM states WHERE best_season = ?', [season]);
  return states;
}

async function getPlacesByStateId(stateId) {
  const [places] = await db.query('SELECT * FROM places WHERE state_id = ?', [stateId]);
  return places;
}

async function getPlaceDetails(placeId) {
  const [details] = await db.query('SELECT point FROM place_details WHERE place_id = ?', [placeId]);
  return details;
}

async function searchPlaces(query) {
  const [places] = await db.query(`
    SELECT p.*, s.name as state_name
    FROM places p
    JOIN states s ON p.state_id = s.id
    WHERE p.name LIKE ? OR s.name LIKE ?
  `, [`%${query}%`, `%${query}%`]);
  return places;
}

module.exports = {
  getAllStates,
  getStateById,
  getStatesBySeason,
  getPlacesByStateId,
  getPlaceDetails,
  searchPlaces
};
