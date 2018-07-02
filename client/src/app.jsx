import React from 'react';
import axios from 'axios';

import { filterReviews } from './helpers/apphelpers';

import ContainerAverageStars from './components/ContainerAverageStars';
import ContainerReviews from './components/ContainerReviews';

import {
  AppOuterWrapper,
  AppInnerWrapper,
} from './App.styles';

import { BasicTextFormatSpan } from './components/styles/MasterStyles.styles';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.getListingId = this.getListingId.bind(this);

    // API calls
    //this.getListingAverageStars = this.getListingAverageStars.bind(this);
    this.getListingAverageStarsNew = this.getListingAverageStarsNew.bind(this);
    this.getListingReviews = this.getListingReviews.bind(this);

    // Methods
    this.handleSearchChange = this.handleSearchChange.bind(this);
    this.handleSearchSubmit = this.handleSearchSubmit.bind(this);

    this.state = {
      averageStarsObj: {},
      allReviews: [],
      renderedReviews: [],
      currentSearch: '',
      err404: false,
    };
  }

  componentDidMount() {
    const id = this.getListingId();
    this.getListingReviews(id);
  }

  getListingId() {
    return window.location.pathname.slice(7, -1);
  }

  getListingAverageStarsNew(data) {
    let avgStars = {
      accuracyAvg: 0,
      communicationAvg: 0,
      cleanlinessAvg: 0,
      locationAvg: 0,
      checkinAvg: 0,
      valueAvg: 0,
      overallAvg: 0,
      numReviews: data.length,
    };

    if(data.length > 0) {
      for (let j = 0; j < data.length; j += 1) {
        // sum up all the results from the reviews
        avgStars.accuracyAvg += data[j].rank_accuracy;
        avgStars.communicationAvg += data[j].rank_communication;
        avgStars.cleanlinessAvg += data[j].rank_cleanliness;
        avgStars.locationAvg += data[j].rank_location;
        avgStars.checkinAvg += data[j].rank_checkin;
        avgStars.valueAvg += data[j].rank_value;
      }
      let denominator = data.length;
      avgStars.accuracyAvg = +(avgStars.accuracyAvg/denominator).toFixed(2);
      avgStars.communicationAvg = +(avgStars.communicationAvg/denominator).toFixed(2);
      avgStars.cleanlinessAvg = +(avgStars.cleanlinessAvg/denominator).toFixed(2);
      avgStars.locationAvg = +(avgStars.locationAvg/denominator).toFixed(2);
      avgStars.checkinAvg = +(avgStars.checkinAvg/denominator).toFixed(2);
      avgStars.valueAvg = +(avgStars.valueAvg/denominator).toFixed(2);
      avgStars.overallAvg = +((avgStars.accuracyAvg + avgStars.communicationAvg + avgStars.cleanlinessAvg + avgStars.locationAvg + avgStars.checkinAvg + avgStars.valueAvg) / 6).toFixed(2);
      
    }
    return avgStars;
  }

  getListingReviews(id) {
    axios.get(`/api/listings/${id}/reviews`)
      .then((response) => {
        const { data } = response;
        const avgStars = this.getListingAverageStarsNew(data);
        this.setState({
          allReviews: data,
          renderedReviews: data,
          averageStarsObj: avgStars,
        });
      })
      .catch((error) => {
        this.setState({
          err404: true,
        });
      });
  }

  handleSearchChange(event) {
    this.setState({
      currentSearch: event.target.value,
    });
  }

  handleSearchSubmit(event) {
    if (event.key === 'Enter') {
      if (this.state.currentSearch) {
        const filteredReviews = filterReviews(this.state.currentSearch, this.state.allReviews);
        this.setState({
          renderedReviews: filteredReviews,
        });
      } else {
        this.setState({
          renderedReviews: this.state.allReviews,
        });
      }
    }
  }

  render() {
    return (
      <AppOuterWrapper>
        {this.state.err404 ?
          (
            <BasicTextFormatSpan>
              <h1> Sorry, that listing does not exist </h1>
            </BasicTextFormatSpan>
          ) : (
            <AppInnerWrapper>
              <ContainerAverageStars
                averageStarsObj={this.state.averageStarsObj}
                currentSearch={this.state.currentSearch}
                handleSearchChange={this.handleSearchChange}
                handleSearchSubmit={this.handleSearchSubmit}
              />
              <ContainerReviews reviews={this.state.renderedReviews} />
            </AppInnerWrapper>
          )
        }
      </AppOuterWrapper>
    );
  }
}

export default App;