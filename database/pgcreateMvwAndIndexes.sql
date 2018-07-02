-- DROP MATERIALIZED VIEW mvw_reviews_50m;
CREATE MATERIALIZED VIEW IF NOT EXISTS mvw_reviews_50m
    AS SELECT 
	  listing_id, review_date, review_text, first_name, rank_accuracy, rank_communication,
	  rank_cleanliness, rank_location, rank_checkin, rank_value
      FROM master_reviews
	  WITH DATA;
	  
-- select * from mvw_reviews_50m where listing_id = 1;

CREATE INDEX mvw_listingId_idx ON mvw_reviews_50m (listing_id);
CREATE INDEX mvw_covering_idx ON mvw_reviews_50m (listing_id, review_date, review_text, first_name, rank_accuracy, rank_communication,
	  rank_cleanliness, rank_location, rank_checkin, rank_value);