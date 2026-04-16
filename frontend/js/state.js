const API_URL = 'http://localhost:3000/api';

async function loadStateDetails() {
  const params = new URLSearchParams(window.location.search);
  const stateId = params.get('id');

  if (!stateId) {
    window.location.href = 'index.html';
    return;
  }

  try {
    const res = await fetch(`${API_URL}/states/${stateId}`);
    const state = await res.json();

    if (!state) {
      document.getElementById('stateDetails').innerHTML =
        '<div class="error">State not found</div>';
      return;
    }

    renderState(state);
  } catch (err) {
    document.getElementById('stateDetails').innerHTML =
      '<div class="error">Failed to load state details</div>';
  }
}

function renderState(state) {
  const container = document.getElementById('stateDetails');

  const placesHtml = state.places.map(place => {
    const points = place.details.map(d => `<li>${d.point}</li>`).join('');
    return `
      <div class="place-card">
        <h3>${place.name}</h3>
        <p>${place.description}</p>
        <ul class="points">${points}</ul>
      </div>
    `;
  }).join('');

  container.innerHTML = `
    <div class="state-header">
      <h1>${state.name}</h1>
      <span class="type">${state.type.toUpperCase()}</span>
      <p><strong>Best Season:</strong> ${capitalize(state.best_season)}</p>
      <p>${state.description}</p>
    </div>
    <h2 style="margin-bottom: 1rem; color: #667eea;">Places to Visit</h2>
    <div class="places-list">${placesHtml}</div>
  `;
}

function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

document.addEventListener('DOMContentLoaded', loadStateDetails);
