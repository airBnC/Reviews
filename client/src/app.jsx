import React from 'react';
import axios from 'axios';
import URL from 'url-parse';

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
    this.getListingAverageStars = this.getListingAverageStars.bind(this);
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
    this.getListingReviews(this.getListingId());
    this.getListingAverageStars(this.getListingId());
  }

  getListingId() {
    const curURL = new URL(window.location.href);
    return curURL.pathname.slice(7, -1);
  }

  getListingAverageStars(id) {
    axios.get(`/api/listings/${id}/averagestars`)
      .then((response) => {
        this.setState({
          averageStarsObj: response.data,
        });
      })
      .catch((error) => {
        this.setState({
          err404: true,
        });
      });
  }

  getListingReviews(id) {
    axios.get(`/api/listings/${id}/reviews`)
      .then((response) => {
        const { data } = response;
        this.setState({
          allReviews: data,
          renderedReviews: data,
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