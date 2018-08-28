-- //https://dev.mysql.com/doc/refman/5.7/en/

DROP DATABASE IF EXISTS airbnc_reviews_module_data;

CREATE DATABASE airbnc_reviews_module_data;

USE airbnc_reviews_module_data;

CREATE TABLE user (
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name TINYTEXT NOT NULL, 
  last_name TINYTEXT NOT NULL
);

-- INSERT INTO user VALUES (NULL, 'Joe', 'Schmo');
-- INSERT INTO user VALUES (NULL, 'Big', 'Papa');

CREATE TABLE review (
  review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  listing_id INT NOT NULL,
  user_id INT NOT NULL,
  review_date DATE,
  review_text VARCHAR(1500) NOT NULL,
  rank_accuracy TINYINT NOT NULL,
  rank_communication TINYINT NOT NULL,
  rank_cleanliness TINYINT NOT NULL,
  rank_location TINYINT NOT NULL,
  rank_checkin TINYINT NOT NULL,
  rank_value TINYINT NOT NULL
);

-- INSERT INTO review VALUES (NULL, 1, 1, '2018-07-11', "Hello it's me", 5, 4, 5, 5, 5, 4);
-- INSERT INTO review VALUES (NULL, 16, 1, '2016-03-19', "I like this house", 5, 4, 5, 5, 5, 4);
-- INSERT INTO review VALUES (NULL, 8, 1, '2018-07-11', "What is up?", 5, 4, 5, 5, 5, 4);

ALTER TABLE review ADD FOREIGN KEY (user_id) REFERENCES user (user_id);

-- for reference: https://dev.mysql.com/doc/refman/5.7/en/load-data.html
-- take a look at the paragraphs that describe the LOCAL keyword 
LOAD DATA LOCAL INFILE 'database/data/userdata.txt' into table user;
LOAD DATA LOCAL INFILE 'database/data/reviewdata.txt' into table review;








