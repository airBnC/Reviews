-- Table: public.tbl_reviews_50m

DROP TABLE master_reviews;

CREATE TABLE master_reviews
(
    id integer NOT NULL DEFAULT nextval('tbl_reviews_id_seq'::regclass),
    listing_id integer NOT NULL,
    user_id integer NOT NULL,
    first_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    review_date date,
    review_text character varying(1500) COLLATE pg_catalog."default" NOT NULL,
    rank_accuracy integer NOT NULL,
    rank_communication integer NOT NULL,
    rank_cleanliness integer NOT NULL,
    rank_location integer NOT NULL,
    rank_checkin integer NOT NULL,
    rank_value integer NOT NULL
) PARTITION BY RANGE (listing_id);

--select * from master_reviews limit 10;
DROP TABLE IF EXISTS prt_reviews_m10;
CREATE TABLE prt_reviews_m10 PARTITION OF master_reviews
  FOR VALUES FROM (1) TO (10000000);

DROP TABLE IF EXISTS prt_reviews_m20;
CREATE TABLE prt_reviews_m20 PARTITION OF master_reviews
  FOR VALUES FROM (10000000) TO (20000000);

DROP TABLE IF EXISTS prt_reviews_m30;
CREATE TABLE prt_reviews_m30 PARTITION OF master_reviews
  FOR VALUES FROM (20000000) TO (30000000);

DROP TABLE IF EXISTS prt_reviews_m40;
CREATE TABLE prt_reviews_m40 PARTITION OF master_reviews
  FOR VALUES FROM (30000000) TO (40000000);

DROP TABLE IF EXISTS prt_reviews_m50;
CREATE TABLE prt_reviews_m50 PARTITION OF master_reviews
  FOR VALUES FROM (40000000) TO (50000000);

DROP TABLE IF EXISTS prt_reviews_m60;
CREATE TABLE prt_reviews_m60 PARTITION OF master_reviews
  FOR VALUES FROM (50000000) TO (60000000);
  
INSERT INTO master_reviews
SELECT * FROM 
tbl_reviews_50m;

CREATE INDEX idx_prt_reviews_m10_listing_id
    ON prt_reviews_m10 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m20_listing_id
    ON prt_reviews_m20 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m30_listing_id
    ON prt_reviews_m30 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m40_listing_id
    ON prt_reviews_m40 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m50_listing_id
    ON prt_reviews_m50 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m60_listing_id
    ON prt_reviews_m60 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m10_covering_review
    ON prt_reviews_m10 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m20_covering_review
    ON prt_reviews_m20 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m30_covering_review
    ON prt_reviews_m30 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m40_covering_review
    ON prt_reviews_m40 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m50_covering_review
    ON prt_reviews_m50 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m60_covering_review
    ON prt_reviews_m60 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;