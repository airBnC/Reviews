CREATE TABLE IF NOT EXISTS tbl_users (
  id SERIAL,
  first_name VARCHAR(100) NOT NULL, 
  last_name VARCHAR(100) NOT NULL,
  user_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS tbl_listings (
  id SERIAL,
  listing_name VARCHAR(250) NULL
);

CREATE TABLE IF NOT EXISTS tbl_reviews (
  id SERIAL,
  listing_id INT NOT NULL,
  user_id INT NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  review_date DATE,
  review_text VARCHAR(1500) NOT NULL,
  rank_accuracy INT NOT NULL,
  rank_communication INT NOT NULL,
  rank_cleanliness INT NOT NULL,
  rank_location INT NOT NULL,
  rank_checkin INT NOT NULL,
  rank_value INT NOT NULL
);
