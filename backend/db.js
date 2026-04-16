const mysql = require('mysql2');

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '1234',
  database: 'tourhub',
  waitForConnections: true,
  connectionLimit: 10
});

module.exports = pool.promise();
