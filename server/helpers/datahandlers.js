module.exports.calcReviewsAverageStars = (averageStarsArray) => {
  let accuracyTot = 0;
  let communicationTot = 0;
  let cleanlinessTot = 0;
  let locationTot = 0;
  let checkinTot = 0;
  let valueTot = 0;
  const numReviews = averageStarsArray.length;

  averageStarsArray.forEach((reviewsStarsObj) => {
    accuracyTot += reviewsStarsObj.rank_accuracy;
    communicationTot += reviewsStarsObj.rank_communication;
    cleanlinessTot += reviewsStarsObj.rank_cleanliness;
    locationTot += reviewsStarsObj.rank_location;
    checkinTot += reviewsStarsObj.rank_checkin;
    valueTot += reviewsStarsObj.rank_value;
  });

  const accuracyAvg = +(accuracyTot / numReviews).toFixed(2);
  const communicationAvg = +(communicationTot / numReviews).toFixed(2);
  const cleanlinessAvg = +(cleanlinessTot / numReviews).toFixed(2);
  const locationAvg = +(locationTot / numReviews).toFixed(2);
  const checkinAvg = +(checkinTot / numReviews).toFixed(2);
  const valueAvg = +(valueTot / numReviews).toFixed(2);
  const overallAvg = +((accuracyAvg + communicationAvg + cleanlinessAvg + locationAvg + checkinAvg + valueAvg) / 6)
    .toFixed(2);

  return {
    overallAvg,
    accuracyAvg,
    communicationAvg,
    cleanlinessAvg,
    locationAvg,
    checkinAvg,
    valueAvg,
    numReviews,
  };
};

// ------------
// ------------
// ------------

module.exports.checkForValidRecord = (queryId, totalRecords) => {
  return (queryId > 0 && queryId <= totalRecords) ? true : false;
};

// ------------
// ------------
// ------------

const months = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};

const convertDateToMonthYYYY = (trimmedDate) => {
  const month = +trimmedDate.slice(0, 2);
  const year = trimmedDate.slice(6, 10);
  return `${months[month]} ${year}`;
};

module.exports.processReviewsArray = (reviewsArray) => {
  const reviewsArrayCopy = reviewsArray.slice();
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  reviewsArrayCopy.forEach((review) => {
    review.review_date = convertDateToMonthYYYY(review.review_date.toLocaleDateString('en-US', options));
  });
  return reviewsArrayCopy;
};
