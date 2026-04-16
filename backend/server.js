const express = require('express');
const cors = require('cors');
const path = require('path');
const stateRoutes = require('./routes/states');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '../frontend')));

app.use('/api/states', stateRoutes);

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/index.html'));
});

app.get('/state/:id', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/state.html'));
});

app.listen(PORT, () => {
  console.log(`TourHub running at http://localhost:${PORT}`);
});
