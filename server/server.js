const express = require('express');
const path = require('path');
const cors = require('cors');

const dbQueries = require('./helpers/queries.js');
const dataHandlers = require('./helpers/datahandlers.js');

const port = process.env.PORT || 3004;

const app = express();

// Allowing all cross origin requests for simplicity, given this is a controlled environment.
// Would not do this in a deployment environment.
app.use(cors());

app.use('/rooms/:id', express.static(path.join(__dirname, '../public')));
app.use('/rooms/:id', express.static(path.join(__dirname, '../client/dist')));

// Decided not to use a router, considering there are only two routes.
// Here's a helpful reference though for the future (note to self):
// https://medium.com/@jeffandersen/building-a-node-js-rest-api-with-express-46b0901f29b6
app.get('/api/listings/:id/reviews', (req, res) => {
  const listingId = req.params.id.replace(/\D/g, '');

  if (dataHandlers.checkForValidRecord(listingId, dbQueries.listings.getTotal())) {
    dbQueries.listingReviews.get(listingId)
      .then((data) => {
        res.status(200).send(JSON.stringify(data));
      })
      .catch((error) => {
        res.status(500).send(JSON.stringify(error));
      });
  } else {
    res.sendStatus(404);
  }
});

app.get('/api/listings/:id/averagestars', (req, res) => {
  const listingId = req.params.id.replace(/\D/g, '');

  if (dataHandlers.checkForValidRecord(listingId, dbQueries.listings.getTotal())) {
    dbQueries.listingAverageStars.get(listingId)
      .then((data) => {
        const reviewStarsObj = dataHandlers.calcReviewsAverageStars(data);
        res.status(200).send(JSON.stringify(reviewStarsObj));
      })
      .catch((error) => {
        res.status(500).send(JSON.stringify(error));
      });
  } else {
    res.sendStatus(404);
  }
});

app.get('*', (req, res) => {
  res.status(404).send('Sorry, that page was not found!  Try the following pathname: /rooms/{id}');
});

app.listen(3004, () => console.log('App listening on port ', port));

