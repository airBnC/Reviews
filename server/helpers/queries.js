const db = require('../../database/index.js');
const mysql = require('mysql');
const Promise = require('bluebird');

module.exports.listingAverageStars = {
  get: (listingId) => {
    return new Promise((resolve, reject) => {
      // Using prepared statements to protect against SQL Injection Attacks
      // See here: https://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html
      // And here: https://github.com/mysqljs/mysql#preparing-queries
      let starsQuery = 'SELECT rank_accuracy, rank_communication, rank_cleanliness, rank_location, rank_checkin, rank_value FROM ?? WHERE ?? = ?';
      const inserts = ['review', 'listing_id', listingId];
      starsQuery = mysql.format(starsQuery, inserts);

      db.dbConnection.query(starsQuery, (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  },
};

module.exports.listingReviews = {
  get: (listingId) => {
    return new Promise((resolve, reject) => {
      let reviewsQuery = 'SELECT review_id, review_date, review_text, user.first_name, user.last_name FROM ?? INNER JOIN ?? ON ?? = ?? WHERE ?? = ?';
      const inserts = ['review', 'user', 'user.user_id', 'review.user_id', 'listing_id', listingId];
      reviewsQuery = mysql.format(reviewsQuery, inserts);

      db.dbConnection.query(reviewsQuery, (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  },
};

module.exports.listings = {
  getTotal: () => {
    // Hard-coded to 100 because I don't have actual listings in my database, just references to listings.

    return 100;

    // However, see below for a theoretical representation of how the query might look
    // (assuming I had listing records in a table called 'listing').
    /*
    return new Promise((resolve, reject) => {
      let numReviewsQuery = 'SELECT COUNT(*) FROM ??';
      const inserts = ['listing'];
      numReviewsQuery = mysql.format(starsQuery, inserts);

      db.dbConnection.query(numReviewsQuery, (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
    */
  },
};
