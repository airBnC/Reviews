
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
  let counter = 0;
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  reviewsArrayCopy.forEach((review) => {
    review.review_date = convertDateToMonthYYYY(review.review_date.toLocaleDateString('en-US', options));
    review.key = counter;
    counter += 1;
  });
  return reviewsArrayCopy;
};
