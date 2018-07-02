const { Pool, Client } = require('pg');
const path = require('path');

const conObject = {
  user: 'jonathanpizzolato',
  host: 'localhost',
  database: 'dev_airbnb_sdc',
  password: 'devadmin',
  port: 5432,
};


const runUserLoad = false;
const runListingLoad = false;
const runReviewLoad = true;
const pool = new Pool(conObject);
// const values;
let queryRuns = false

if (runUserLoad) {
  queryRuns = true;
  let filePath = path.resolve(__dirname, 'seed/users.csv');
  let sql = `COPY tbl_users (first_name, last_name, user_name)  FROM '${filePath}' WITH DELIMITER '|' CSV HEADER;`;

  console.time('writeToDb');
  (async () => {
    const client = await pool.connect();
    try {
      const res = await client.query(sql);
      console.timeEnd('writeToDb');
      console.log(res.rows[0]);
    } finally {
      client.release();
    }
  })().catch(e => console.log(e.stack));
}

if (runListingLoad) {
  queryRuns = true;
  let filePath = path.resolve(__dirname, 'seed/listingIds.csv');
  let sql = `COPY tbl_listings (listing_name)  FROM '${filePath}' WITH DELIMITER '|' CSV HEADER;`;

  console.time('writeToDb');
  (async () => {
    const client = await pool.connect();
    try {
      const res = await client.query(sql);
      console.timeEnd('writeToDb');
      console.log(res.rows[0]);
    } finally {
      client.release();
    }
  })().catch(e => console.log(e.stack));
}

if (runReviewLoad) {
  queryRuns = true;
  let filePath = path.resolve(__dirname, 'seed/reviewComments.csv');
  let sql = `COPY tbl_reviews (listing_id, user_id, first_name, review_date, review_text, rank_accuracy, rank_communication, rank_cleanliness, rank_location, rank_checkin, rank_value)  FROM '${filePath}' WITH DELIMITER '|' CSV HEADER;`;

  console.time('writeToDb');
  (async () => {
    const client = await pool.connect();
    try {
      const res = await client.query(sql);
      console.timeEnd('writeToDb');
      console.log(res.rows[0]);
    } finally {
      client.release();
    }
  })().catch(e => console.log(e.stack));
}

console.log('writing to db: ', queryRuns);
