-- Table: public.tbl_reviews_50m

-- DROP TABLE master_reviews;

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
DROP TABLE IF EXISTS prt_reviews_m1;
CREATE TABLE prt_reviews_m1 PARTITION OF master_reviews
  FOR VALUES FROM (1) TO (1000000);

DROP TABLE IF EXISTS prt_reviews_m2;
CREATE TABLE prt_reviews_m2 PARTITION OF master_reviews
  FOR VALUES FROM (1000000) TO (2000000);

DROP TABLE IF EXISTS prt_reviews_m3;
CREATE TABLE prt_reviews_m3 PARTITION OF master_reviews
  FOR VALUES FROM (2000000) TO (3000000);

DROP TABLE IF EXISTS prt_reviews_m4;
CREATE TABLE prt_reviews_m4 PARTITION OF master_reviews
  FOR VALUES FROM (3000000) TO (4000000);

DROP TABLE IF EXISTS prt_reviews_m5;
CREATE TABLE prt_reviews_m5 PARTITION OF master_reviews
  FOR VALUES FROM (4000000) TO (5000000);

DROP TABLE IF EXISTS prt_reviews_m6;
CREATE TABLE prt_reviews_m6 PARTITION OF master_reviews
  FOR VALUES FROM (5000000) TO (6000000);

------------
DROP TABLE IF EXISTS prt_reviews_m7;
CREATE TABLE prt_reviews_m7 PARTITION OF master_reviews
  FOR VALUES FROM (6000000) TO (7000000);
  
 DROP TABLE IF EXISTS prt_reviews_m8;
CREATE TABLE prt_reviews_m8 PARTITION OF master_reviews
  FOR VALUES FROM (7000000) TO (8000000);
  
 DROP TABLE IF EXISTS prt_reviews_m9;
CREATE TABLE prt_reviews_m9 PARTITION OF master_reviews
  FOR VALUES FROM (8000000) TO (9000000);
  
 DROP TABLE IF EXISTS prt_reviews_m10;
CREATE TABLE prt_reviews_m10 PARTITION OF master_reviews
  FOR VALUES FROM (9000000) TO (10000000);
  
/**********************************
*        second ten million 
***********************************/
DROP TABLE IF EXISTS prt_reviews_m11;
CREATE TABLE prt_reviews_m11 PARTITION OF master_reviews
  FOR VALUES FROM (10000000) TO (11000000);

DROP TABLE IF EXISTS prt_reviews_m12;
CREATE TABLE prt_reviews_m12 PARTITION OF master_reviews
  FOR VALUES FROM (11000000) TO (12000000);

DROP TABLE IF EXISTS prt_reviews_m13;
CREATE TABLE prt_reviews_m13 PARTITION OF master_reviews
  FOR VALUES FROM (12000000) TO (13000000);

DROP TABLE IF EXISTS prt_reviews_m14;
CREATE TABLE prt_reviews_m14 PARTITION OF master_reviews
  FOR VALUES FROM (13000000) TO (14000000);

DROP TABLE IF EXISTS prt_reviews_m15;
CREATE TABLE prt_reviews_m15 PARTITION OF master_reviews
  FOR VALUES FROM (14000000) TO (15000000);

DROP TABLE IF EXISTS prt_reviews_m16;
CREATE TABLE prt_reviews_m16 PARTITION OF master_reviews
  FOR VALUES FROM (15000000) TO (16000000);

DROP TABLE IF EXISTS prt_reviews_m17;
CREATE TABLE prt_reviews_m17 PARTITION OF master_reviews
  FOR VALUES FROM (16000000) TO (17000000);
  
 DROP TABLE IF EXISTS prt_reviews_m18;
CREATE TABLE prt_reviews_m18 PARTITION OF master_reviews
  FOR VALUES FROM (17000000) TO (18000000);
  
 DROP TABLE IF EXISTS prt_reviews_m19;
CREATE TABLE prt_reviews_m19 PARTITION OF master_reviews
  FOR VALUES FROM (18000000) TO (19000000);
  
 DROP TABLE IF EXISTS prt_reviews_m20;
CREATE TABLE prt_reviews_m20 PARTITION OF master_reviews
  FOR VALUES FROM (19000000) TO (20000000);
  
  
/**********************************
*        third ten million 
***********************************/
DROP TABLE IF EXISTS prt_reviews_m21;
CREATE TABLE prt_reviews_m21 PARTITION OF master_reviews
  FOR VALUES FROM (20000000) TO (21000000);

DROP TABLE IF EXISTS prt_reviews_m22;
CREATE TABLE prt_reviews_m22 PARTITION OF master_reviews
  FOR VALUES FROM (21000000) TO (22000000);

DROP TABLE IF EXISTS prt_reviews_m23;
CREATE TABLE prt_reviews_m23 PARTITION OF master_reviews
  FOR VALUES FROM (22000000) TO (23000000);

DROP TABLE IF EXISTS prt_reviews_m24;
CREATE TABLE prt_reviews_m24 PARTITION OF master_reviews
  FOR VALUES FROM (23000000) TO (24000000);

DROP TABLE IF EXISTS prt_reviews_m25;
CREATE TABLE prt_reviews_m25 PARTITION OF master_reviews
  FOR VALUES FROM (24000000) TO (25000000);

DROP TABLE IF EXISTS prt_reviews_m26;
CREATE TABLE prt_reviews_m26 PARTITION OF master_reviews
  FOR VALUES FROM (25000000) TO (26000000);

DROP TABLE IF EXISTS prt_reviews_m27;
CREATE TABLE prt_reviews_m27 PARTITION OF master_reviews
  FOR VALUES FROM (26000000) TO (27000000);
  
 DROP TABLE IF EXISTS prt_reviews_m28;
CREATE TABLE prt_reviews_m28 PARTITION OF master_reviews
  FOR VALUES FROM (27000000) TO (28000000);
  
 DROP TABLE IF EXISTS prt_reviews_m29;
CREATE TABLE prt_reviews_m29 PARTITION OF master_reviews
  FOR VALUES FROM (28000000) TO (29000000);
  
 DROP TABLE IF EXISTS prt_reviews_m30;
CREATE TABLE prt_reviews_m30 PARTITION OF master_reviews
  FOR VALUES FROM (29000000) TO (30000000);  
  
/**********************************
*        fourth ten million 
***********************************/
DROP TABLE IF EXISTS prt_reviews_m31;
CREATE TABLE prt_reviews_m31 PARTITION OF master_reviews
  FOR VALUES FROM (30000000) TO (31000000);

DROP TABLE IF EXISTS prt_reviews_m32;
CREATE TABLE prt_reviews_m32 PARTITION OF master_reviews
  FOR VALUES FROM (31000000) TO (32000000);

DROP TABLE IF EXISTS prt_reviews_m33;
CREATE TABLE prt_reviews_m33 PARTITION OF master_reviews
  FOR VALUES FROM (32000000) TO (33000000);

DROP TABLE IF EXISTS prt_reviews_m34;
CREATE TABLE prt_reviews_m34 PARTITION OF master_reviews
  FOR VALUES FROM (33000000) TO (34000000);

DROP TABLE IF EXISTS prt_reviews_m35;
CREATE TABLE prt_reviews_m35 PARTITION OF master_reviews
  FOR VALUES FROM (34000000) TO (35000000);

DROP TABLE IF EXISTS prt_reviews_m36;
CREATE TABLE prt_reviews_m36 PARTITION OF master_reviews
  FOR VALUES FROM (35000000) TO (36000000);

DROP TABLE IF EXISTS prt_reviews_m37;
CREATE TABLE prt_reviews_m37 PARTITION OF master_reviews
  FOR VALUES FROM (36000000) TO (37000000);
  
 DROP TABLE IF EXISTS prt_reviews_m38;
CREATE TABLE prt_reviews_m38 PARTITION OF master_reviews
  FOR VALUES FROM (37000000) TO (38000000);
  
 DROP TABLE IF EXISTS prt_reviews_m39;
CREATE TABLE prt_reviews_m39 PARTITION OF master_reviews
  FOR VALUES FROM (38000000) TO (39000000);
  
 DROP TABLE IF EXISTS prt_reviews_m40;
CREATE TABLE prt_reviews_m40 PARTITION OF master_reviews
  FOR VALUES FROM (39000000) TO (40000000);  
  
/**********************************
*        fifth ten million 
***********************************/
DROP TABLE IF EXISTS prt_reviews_m41;
CREATE TABLE prt_reviews_m41 PARTITION OF master_reviews
  FOR VALUES FROM (40000000) TO (41000000);

DROP TABLE IF EXISTS prt_reviews_m42;
CREATE TABLE prt_reviews_m42 PARTITION OF master_reviews
  FOR VALUES FROM (41000000) TO (42000000);

DROP TABLE IF EXISTS prt_reviews_m43;
CREATE TABLE prt_reviews_m43 PARTITION OF master_reviews
  FOR VALUES FROM (42000000) TO (43000000);

DROP TABLE IF EXISTS prt_reviews_m44;
CREATE TABLE prt_reviews_m44 PARTITION OF master_reviews
  FOR VALUES FROM (43000000) TO (44000000);

DROP TABLE IF EXISTS prt_reviews_m45;
CREATE TABLE prt_reviews_m45 PARTITION OF master_reviews
  FOR VALUES FROM (44000000) TO (45000000);

DROP TABLE IF EXISTS prt_reviews_m46;
CREATE TABLE prt_reviews_m46 PARTITION OF master_reviews
  FOR VALUES FROM (45000000) TO (46000000);

DROP TABLE IF EXISTS prt_reviews_m47;
CREATE TABLE prt_reviews_m47 PARTITION OF master_reviews
  FOR VALUES FROM (46000000) TO (47000000);
  
 DROP TABLE IF EXISTS prt_reviews_m48;
CREATE TABLE prt_reviews_m48 PARTITION OF master_reviews
  FOR VALUES FROM (47000000) TO (48000000);
  
 DROP TABLE IF EXISTS prt_reviews_m49;
CREATE TABLE prt_reviews_m49 PARTITION OF master_reviews
  FOR VALUES FROM (48000000) TO (49000000);
  
 DROP TABLE IF EXISTS prt_reviews_m50;
CREATE TABLE prt_reviews_m50 PARTITION OF master_reviews
  FOR VALUES FROM (49000000) TO (50000000);  
  
 /**********************************
*        sixth ten million 
***********************************/
DROP TABLE IF EXISTS prt_reviews_m51;
CREATE TABLE prt_reviews_m51 PARTITION OF master_reviews
  FOR VALUES FROM (50000000) TO (51000000);

DROP TABLE IF EXISTS prt_reviews_m52;
CREATE TABLE prt_reviews_m52 PARTITION OF master_reviews
  FOR VALUES FROM (51000000) TO (52000000);
  
DROP TABLE IF EXISTS prt_reviews_m53;
CREATE TABLE prt_reviews_m53 PARTITION OF master_reviews
  FOR VALUES FROM (52000000) TO (53000000);

DROP TABLE IF EXISTS prt_reviews_m54;
CREATE TABLE prt_reviews_m54 PARTITION OF master_reviews
  FOR VALUES FROM (53000000) TO (54000000);

DROP TABLE IF EXISTS prt_reviews_m55;
CREATE TABLE prt_reviews_m55 PARTITION OF master_reviews
  FOR VALUES FROM (54000000) TO (55000000);

DROP TABLE IF EXISTS prt_reviews_m56;
CREATE TABLE prt_reviews_m56 PARTITION OF master_reviews
  FOR VALUES FROM (55000000) TO (56000000);

DROP TABLE IF EXISTS prt_reviews_m57;
CREATE TABLE prt_reviews_m57 PARTITION OF master_reviews
  FOR VALUES FROM (56000000) TO (57000000);
  
 DROP TABLE IF EXISTS prt_reviews_m58;
CREATE TABLE prt_reviews_m58 PARTITION OF master_reviews
  FOR VALUES FROM (57000000) TO (58000000);
  
 DROP TABLE IF EXISTS prt_reviews_m59;
CREATE TABLE prt_reviews_m59 PARTITION OF master_reviews
  FOR VALUES FROM (58000000) TO (59000000);
  
 DROP TABLE IF EXISTS prt_reviews_m60;
CREATE TABLE prt_reviews_m60 PARTITION OF master_reviews
  FOR VALUES FROM (59000000) TO (60000000);  
  
/**********************************
*        seed the table
***********************************/ 
INSERT INTO master_reviews
SELECT * FROM 
tbl_reviews_50m;


CREATE INDEX idx_prt_reviews_m1_listing_id
    ON prt_reviews_m1 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m2_listing_id
    ON prt_reviews_m2 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m3_listing_id
    ON prt_reviews_m3 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m4_listing_id
    ON prt_reviews_m4 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m5_listing_id
    ON prt_reviews_m5 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m6_listing_id
    ON prt_reviews_m6 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m7_listing_id
    ON prt_reviews_m7 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m8_listing_id
    ON prt_reviews_m8 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m9_listing_id
    ON prt_reviews_m9 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m10_listing_id
    ON prt_reviews_m10 USING btree
    (listing_id)
    TABLESPACE pg_default;

/***************************
*        second ten
***************************/
CREATE INDEX idx_prt_reviews_m11_listing_id
    ON prt_reviews_m11 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m12_listing_id
    ON prt_reviews_m12 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m13_listing_id
    ON prt_reviews_m13 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m14_listing_id
    ON prt_reviews_m14 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m15_listing_id
    ON prt_reviews_m15 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m16_listing_id
    ON prt_reviews_m16 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m17_listing_id
    ON prt_reviews_m17 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m18_listing_id
    ON prt_reviews_m18 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m19_listing_id
    ON prt_reviews_m19 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m20_listing_id
    ON prt_reviews_m20 USING btree
    (listing_id)
    TABLESPACE pg_default;

/***************************
*        third ten
***************************/
CREATE INDEX idx_prt_reviews_m21_listing_id
    ON prt_reviews_m21 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m22_listing_id
    ON prt_reviews_m22 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m23_listing_id
    ON prt_reviews_m23 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m24_listing_id
    ON prt_reviews_m24 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m25_listing_id
    ON prt_reviews_m25 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m26_listing_id
    ON prt_reviews_m26 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m27_listing_id
    ON prt_reviews_m27 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m28_listing_id
    ON prt_reviews_m28 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m29_listing_id
    ON prt_reviews_m29 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m30_listing_id
    ON prt_reviews_m30 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
/***************************
*        fourth ten
***************************/
CREATE INDEX idx_prt_reviews_m31_listing_id
    ON prt_reviews_m31 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m32_listing_id
    ON prt_reviews_m32 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m33_listing_id
    ON prt_reviews_m33 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m34_listing_id
    ON prt_reviews_m34 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m35_listing_id
    ON prt_reviews_m35 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m36_listing_id
    ON prt_reviews_m36 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m37_listing_id
    ON prt_reviews_m37 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m38_listing_id
    ON prt_reviews_m38 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m39_listing_id
    ON prt_reviews_m39 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m40_listing_id
    ON prt_reviews_m40 USING btree
    (listing_id)
    TABLESPACE pg_default;

/***************************
*        fifth ten
***************************/
CREATE INDEX idx_prt_reviews_m41_listing_id
    ON prt_reviews_m41 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m42_listing_id
    ON prt_reviews_m42 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m43_listing_id
    ON prt_reviews_m43 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m44_listing_id
    ON prt_reviews_m44 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m45_listing_id
    ON prt_reviews_m45 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m46_listing_id
    ON prt_reviews_m46 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m47_listing_id
    ON prt_reviews_m47 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m48_listing_id
    ON prt_reviews_m48 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m49_listing_id
    ON prt_reviews_m49 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m50_listing_id
    ON prt_reviews_m50 USING btree
    (listing_id)
    TABLESPACE pg_default;

/***************************
*        sixth ten
***************************/
CREATE INDEX idx_prt_reviews_m51_listing_id
    ON prt_reviews_m51 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m52_listing_id
    ON prt_reviews_m52 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m53_listing_id
    ON prt_reviews_m53 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m54_listing_id
    ON prt_reviews_m54 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m55_listing_id
    ON prt_reviews_m55 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m56_listing_id
    ON prt_reviews_m56 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m57_listing_id
    ON prt_reviews_m57 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m58_listing_id
    ON prt_reviews_m58 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m59_listing_id
    ON prt_reviews_m59 USING btree
    (listing_id)
    TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m60_listing_id
    ON prt_reviews_m60 USING btree
    (listing_id)
    TABLESPACE pg_default;
	
/**************************
*  first 10 covering index 
**************************/
CREATE INDEX idx_prt_reviews_m1_covering_review
    ON prt_reviews_m1 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m2_covering_review
    ON prt_reviews_m2 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m3_covering_review
    ON prt_reviews_m3 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m4_covering_review
    ON prt_reviews_m4 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m5_covering_review
    ON prt_reviews_m5 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m6_covering_review
    ON prt_reviews_m6 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m7_covering_review
    ON prt_reviews_m7 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m8_covering_review
    ON prt_reviews_m8 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m9_covering_review
    ON prt_reviews_m9 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m10_covering_review
    ON prt_reviews_m10 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
	
	
/**************************
*  second 10 covering index 
**************************/
CREATE INDEX idx_prt_reviews_m11_covering_review
    ON prt_reviews_m11 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m12_covering_review
    ON prt_reviews_m12 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m13_covering_review
    ON prt_reviews_m13 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m14_covering_review
    ON prt_reviews_m14 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m15_covering_review
    ON prt_reviews_m15 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m16_covering_review
    ON prt_reviews_m16 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m17_covering_review
    ON prt_reviews_m17 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m18_covering_review
    ON prt_reviews_m18 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m19_covering_review
    ON prt_reviews_m19 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m20_covering_review
    ON prt_reviews_m20 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;	
	
	
/**************************
*  third 10 covering index 
**************************/
CREATE INDEX idx_prt_reviews_m21_covering_review
    ON prt_reviews_m21 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m22_covering_review
    ON prt_reviews_m22 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m23_covering_review
    ON prt_reviews_m23 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m24_covering_review
    ON prt_reviews_m24 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m25_covering_review
    ON prt_reviews_m25 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m26_covering_review
    ON prt_reviews_m26 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m27_covering_review
    ON prt_reviews_m27 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m28_covering_review
    ON prt_reviews_m28 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m29_covering_review
    ON prt_reviews_m29 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m30_covering_review
    ON prt_reviews_m30 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;		
	
/**************************
*  fourth 10 covering index 
**************************/
CREATE INDEX idx_prt_reviews_m31_covering_review
    ON prt_reviews_m31 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m32_covering_review
    ON prt_reviews_m32 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m33_covering_review
    ON prt_reviews_m33 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m34_covering_review
    ON prt_reviews_m34 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m35_covering_review
    ON prt_reviews_m35 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m36_covering_review
    ON prt_reviews_m36 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m37_covering_review
    ON prt_reviews_m37 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m38_covering_review
    ON prt_reviews_m38 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m39_covering_review
    ON prt_reviews_m39 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m40_covering_review
    ON prt_reviews_m40 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;	
	
/**************************
*  fifth 10 covering index 
**************************/
CREATE INDEX idx_prt_reviews_m41_covering_review
    ON prt_reviews_m41 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m42_covering_review
    ON prt_reviews_m42 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m43_covering_review
    ON prt_reviews_m43 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m44_covering_review
    ON prt_reviews_m44 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m45_covering_review
    ON prt_reviews_m45 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m46_covering_review
    ON prt_reviews_m46 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m47_covering_review
    ON prt_reviews_m47 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m48_covering_review
    ON prt_reviews_m48 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m49_covering_review
    ON prt_reviews_m49 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m50_covering_review
    ON prt_reviews_m50 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;	
		
/**************************
*  sixth 10 covering index 
**************************/
CREATE INDEX idx_prt_reviews_m51_covering_review
    ON prt_reviews_m51 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m52_covering_review
    ON prt_reviews_m52 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m53_covering_review
    ON prt_reviews_m53 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m54_covering_review
    ON prt_reviews_m54 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m55_covering_review
    ON prt_reviews_m55 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;

CREATE INDEX idx_prt_reviews_m56_covering_review
    ON prt_reviews_m56 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m57_covering_review
    ON prt_reviews_m57 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m58_covering_review
    ON prt_reviews_m58 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m59_covering_review
    ON prt_reviews_m59 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;
	
CREATE INDEX idx_prt_reviews_m60_covering_review
    ON prt_reviews_m60 USING btree
	(listing_id, first_name, review_date, review_text)
	TABLESPACE pg_default;	
	
	
	
	
	