import React from 'react';
import PropTypes from 'prop-types';

const ReviewEntry = props => (
  <div>
    <h6> Reviewer Name </h6>
    <h6> Review Date </h6>
    <h6> Review Text </h6>
  </div>
);

ReviewEntry.propTypes = {
  review: PropTypes.shape({
    review_date: PropTypes.string,
    review_text: PropTypes.string,
    first_name: PropTypes.string,
    last_name: PropTypes.string,
  }),
};

ReviewEntry.defaultProps = {
  review: {
    review_date: '2016-11-04',
    review_text: 'Laborum eius id rerum et in ratione',
    first_name: 'Toby',
    last_name: 'Keith',
  },
};

export default ReviewEntry;
