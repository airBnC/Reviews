const { Client, Pool } = require('pg');

// const { Pool, Client } = require('pg');
// const pool = new Pool(conObject);
const pgConnection = new Pool({
  user: 'jonathanpizzolato',
  host: 'localhost',
  database: 'dev_airbnb_sdc',
  password: 'devadmin',
  port: 5432,
  max: 100,
});
//max: 50,

module.exports = {
  pgConnection,
};
