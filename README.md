# TourHub - Explore India

Tourism web app showcasing India's 28 states and 7 union territories.

## Setup

### 1. Install Dependencies
```bash
cd tourhub
npm install
```

### 2. Setup Database
```bash
mysql -u root -p1234 < database/schema.sql
```

### 3. Start Server
```bash
npm start
```

### 4. Open Browser
```
http://localhost:3000
```

## Features

- View all states/UTs
- Filter by season (Summer/Winter/Monsoon)
- Search places
- Detailed state pages with 10 bullet points per place

## API Endpoints

- `GET /api/states` - All states
- `GET /api/states/:id` - State with places
- `GET /api/states/season/:season` - Filter by season
- `GET /api/states/search?q=query` - Search places

## Project Structure

```
tourhub/
├── backend/
│   ├── server.js
│   ├── db.js
│   ├── routes/states.js
│   ├── controllers/stateController.js
│   └── models/stateModel.js
├── frontend/
│   ├── index.html
│   ├── state.html
│   ├── css/style.css
│   └── js/app.js, state.js
├── database/schema.sql
└── package.json
```
