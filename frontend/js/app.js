const API_URL = 'http://localhost:3000/api';

async function loadStates() {
  try {
    const res = await fetch(`${API_URL}/states`);
    const states = await res.json();
    renderStates(states);
  } catch (err) {
    document.getElementById('statesGrid').innerHTML =
      '<div class="error">Failed to load states. Ensure backend is running.</div>';
  }
}

function renderStates(states) {
  const grid = document.getElementById('statesGrid');
  grid.innerHTML = states.map(state => `
    <div class="state-card" onclick="goToState(${state.id})">
      <h3>${state.name}</h3>
      <span class="type">${state.type.toUpperCase()}</span>
      <div class="season">Best: ${capitalize(state.best_season)}</div>
      <p>${state.description}</p>
    </div>
  `).join('');
}

function goToState(id) {
  window.location.href = `state.html?id=${id}`;
}

function showSeasonFilter() {
  document.getElementById('seasonFilter').style.display = 'block';
}

async function filterBySeason(season) {
  try {
    const res = await fetch(`${API_URL}/states/season/${season}`);
    const states = await res.json();
    renderStates(states);
    document.getElementById('seasonFilter').style.display = 'none';
  } catch (err) {
    console.error('Filter error:', err);
  }
}

function clearFilter() {
  document.getElementById('seasonFilter').style.display = 'none';
  loadStates();
}

async function searchPlaces() {
  const query = document.getElementById('searchInput').value;
  if (!query) return;

  try {
    const res = await fetch(`${API_URL}/states/search?q=${encodeURIComponent(query)}`);
    const places = await res.json();

    const grid = document.getElementById('statesGrid');
    if (places.length === 0) {
      grid.innerHTML = '<div class="error">No results found</div>';
      return;
    }

    grid.innerHTML = places.map(place => `
      <div class="state-card">
        <h3>${place.name}</h3>
        <div class="season">In ${place.state_name}</div>
        <p>${place.description}</p>
      </div>
    `).join('');
  } catch (err) {
    console.error('Search error:', err);
  }
}

function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

document.addEventListener('DOMContentLoaded', loadStates);

document.getElementById('searchInput').addEventListener('keypress', (e) => {
  if (e.key === 'Enter') searchPlaces();
});
