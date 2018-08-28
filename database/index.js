const mysql = require('mysql');

const dbConnection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'airbnc_reviews_module_data',
});

dbConnection.connect((err) => {
  if (err) { throw err; }
  console.log('mysql connected');
});

module.exports.dbConnection = dbConnection;
