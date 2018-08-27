import React from 'react';
import PropTypes from 'prop-types';

import ReviewEntry from './ReviewEntry';

import { BasicWrapperFlexColumnDiv } from './styles/MasterStyles.styles';

const ContainerReviews = props => (
  <BasicWrapperFlexColumnDiv>
    {props.reviews.map(review => <ReviewEntry key={review.review_id} review={review} />)}
  </BasicWrapperFlexColumnDiv>
);

ContainerReviews.propTypes = {
  reviews: PropTypes.arrayOf(PropTypes.shape({
    review_date: PropTypes.string,
    review_text: PropTypes.string,
    first_name: PropTypes.string,
    last_name: PropTypes.string,
    key: PropTypes.number,
  })),
};

ContainerReviews.defaultProps = {
  reviews: [{
    review_date: '2016-11-04',
    review_text: 'Laborum eius id rerum et in ratione',
    first_name: 'Toby',
    last_name: 'Keith',
    key: 0,
  }],
};

export default ContainerReviews;
