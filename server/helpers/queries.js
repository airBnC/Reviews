const db = require('../../database/index.js');
const mysql = require('mysql');
const Promise = require('bluebird');

module.exports.listingAverageStars = {
  get: (listingId) => {
    return new Promise((resolve, reject) => {

      // This is a dense query.
      // I wanted to see if I could grab the data from the database exactly as the client needed it
      // instead of pulling it, formatting it with a helper function, and then sending to the client.
      // So --
      // I am grabbing the average review by category (and total reviews) for a given listing.
      // I am also grabbing the average of those averages to calculate the overall average.
      // I am then combining those two tables into one.

      let starsQuery = `
        SELECT * FROM
        (SELECT ROUND(AVG(rank_accuracy),2) AS accuracyAvg, ROUND(AVG(rank_communication),2) AS communicationAvg, ROUND(AVG(rank_cleanliness),2) AS cleanlinessAvg, ROUND(AVG(rank_location),2) AS locationAvg, ROUND(AVG(rank_checkin),2) AS checkinAvg, ROUND(AVG(rank_value),2) AS valueAvg, COUNT(*) AS numReviews
        FROM ??
        WHERE ?? = ?)
        AS averages
        CROSS JOIN
        (SELECT overall.overallAvg
        FROM
          (SELECT ROUND((avgs.acc + avgs.com + avgs.cln + avgs.loc + avgs.chk + avgs.val) / 6, 2)
          AS overallAvg
          FROM 
            (SELECT AVG(rank_accuracy) AS acc, AVG(rank_communication) AS com, AVG(rank_cleanliness) AS cln, AVG(rank_location) AS loc, AVG(rank_checkin) AS chk, AVG(rank_value) AS val
            FROM ?? WHERE ?? = ?)
            AS avgs)
          AS overall)
        AS result`;

      // I'm using prepared statements to protect against SQL Injection Attacks
      // See here: https://dev.mysql.com/doc/refman/5.7/en/sql-syntax-prepared-statements.html
      // And here: https://github.com/mysqljs/mysql#preparing-queries

      const inserts = ['review', 'listing_id', listingId, 'review', 'listing_id', listingId];

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

      let reviewsQuery = `
        SELECT review_id, DATE_FORMAT(review_date, "%M %Y") review_date, review_text, user.first_name, user.last_name
        FROM ??
        INNER JOIN ??
        ON ?? = ??
        WHERE ?? = ?`;

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
