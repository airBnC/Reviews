const db = require('../../database/index.js');
const Promise = require('bluebird');

module.exports.listingAverageStars = {
  get: (listingId) => {
    return new Promise((resolve, reject) => {
      // Using prepared statements to protect against SQL Injection Attacks
      // See here: https://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html
      // And here: https://github.com/mysqljs/mysql#preparing-queries
      // const sql = `SELECT AVG(rank_accuracy) as rank_accuracy, AVG(rank_communication) as rank_communication, 
      //            AVG(rank_cleanliness) as rank_cleanliness, AVG(rank_location) as rank_location, 
      //            AVG(rank_checkin) as rank_checkin, AVG(rank_value) as rank_value 
      //            FROM tbl_reviews WHERE listing_id = $1`;
      const sql = `SELECT AVG(rank_accuracy) as rank_accuracy, AVG(rank_communication) as rank_communication, 
      AVG(rank_cleanliness) as rank_cleanliness, AVG(rank_location) as rank_location, 
      AVG(rank_checkin) as rank_checkin, AVG(rank_value) as rank_value 
      FROM mvw_reviews_50m WHERE listing_id = ${listingId}`;
      db.pgConnection.query(sql, (err, result) => {
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
      // const sql = {
      //   name: 'fetch-reviews',
      //   text: `SELECT r.review_date, r.review_text, r.first_name 
      //         FROM tbl_reviews as r 
      //         WHERE listing_id = $1`,
      //   values: [listingId],
      // };
      let sql = `SELECT r.review_date, r.review_text, r.first_name, 
      r.rank_accuracy, r.rank_communication, r.rank_cleanliness, r.rank_location, r.rank_checkin, r.rank_value
      FROM mvw_reviews_50m as r WHERE listing_id = ${listingId}`
      db.pgConnection.query(sql, (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  },
  post: (review) => {
    return new Promise((resolve, reject) => {
      const sql = 'INSERT INTO master_reviews (listing_id, user_id, first_name, review_date, review_text, rank_accuracy, rank_communication, rank_cleanliness, rank_location, rank_checkin, rank_value) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)';
      const listingId = review.listingId;
      const userId = review.userId;
      const firstName = review.firstName || 'Anonymous';
      const reviewDate = review.reviewDate || new Date();
      const reviewText = review.reviewText || '';
      const rankAccuracy = review.rankAccuracy || 0;
      const rankCommunication = review.rankCommunication || 0;
      const rankCleanliness = review.rankCleanliness || 0;
      const rankLocation = review.rankLocation || 0;
      const rankCheckin = review.rankCheckin || 0;
      const rankValue = review.rankValue || 0;
      const inserts = [listingId, userId, firstName, reviewDate, reviewText, rankAccuracy, rankCommunication, rankCleanliness, rankLocation, rankCheckin, rankValue];

      db.pgConnection.query(sql, inserts, (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  },
  put: (review) => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT "UPDATE STATEMENT RAN";'; // Just putting in a dummy query in place of an update

      db.pgConnection.query(sql, (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      });
    });
  },
  delete: (review) => {
    return new Promise((resolve, reject) => {
      const sql = 'DELETE FROM master_reviews WHERE id = $1;';
      const reviewId = review.reviewId || null;
      const inserts = [reviewId];

      db.pgConnection.query(sql, inserts, (err, result) => {
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
