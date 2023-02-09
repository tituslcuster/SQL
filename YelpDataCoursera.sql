/* Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.
*/


  ---------------------------------------------------
--| Part 1: Yelp Dataset Profiling and Understanding |--
  ---------------------------------------------------

/* 1. Profile the data by finding the total number of records for each of the tables below: */

SELECT COUNT(*) 
FROM attribute; 
-- i. Attribute table = 10000 

SELECT COUNT(*) 
FROM business; 
-- ii. Business table = 10000 

SELECT COUNT(*) 
FROM category; 
-- iii. Category table = 10000 

SELECT COUNT(*) 
FROM checkin; 
-- iv. Checkin table = 10000 

SELECT COUNT(*) 
FROM elite_years; 
-- v. elite_years table = 10000 

SELECT COUNT(*) 
FROM friend; 
-- vi. friend table = 10000 

SELECT COUNT(*) 
FROM hours; 
-- vii. hours table = 10000 

SELECT COUNT(*) 
FROM photo; 
-- viii. photo table = 10000 

SELECT COUNT(*) 
FROM review; 
-- ix. review table = 10000 

SELECT COUNT(*) 
FROM tip; 
-- x. tip table = 10000 

SELECT COUNT(*) 
FROM user; 
-- xi. user table = 10000 
	

/* 2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key. */

SELECT COUNT(*) 
FROM friend; 
-- i. Business = 10000 
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000 
vi. Checkin = 493 
vii. Photo = 6493 
viii. Tip = 3979 (business_id), 537 (user_id)
ix. User = 10000 
x. Friend = 11
xi. Elite_years = 2780 

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



/* 3. Are there any columns with null values in the Users table? Indicate "yes," or "no." */

	Answer: no 
	
-- SQL code used to arrive at answer:
	
	SELECT *
	FROM user
	WHERE id IS NULL
		OR name IS NULL
		OR review_count IS NULL
		OR yelping_since IS NULL
		OR useful IS NULL
		OR funny IS NULL
		OR cool IS NULL
		OR fans IS NULL
		OR average_stars IS NULL
		OR compliment_hot IS NULL
		OR compliment_more IS NULL
		OR compliment_profile IS NULL
		OR compliment_cute IS NULL
		OR compliment_list IS NULL
		OR compliment_note IS NULL
		OR compliment_plain IS NULL
		OR compliment_cool IS NULL
		OR compliment_funny IS NULL
		OR compliment_writer IS NULL
		OR compliment_photos IS NULL;
	
	
/* 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields: */

	-- i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg: 3.7082
		
	
	-- ii. Table: Business, Column: Stars
	
		min: 1.0		max: 5.0		avg: 3.6549 
		
	
	-- iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144 
		
	
	-- iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg:  1.9414
		
	
	-- v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995 
		


/* 5. List the cities with the most reviews in descending order: */

	-- SQL code used to arrive at answer: 
	SELECT city,
		review_count
	FROM business
	GROUP BY city
	ORDER BY review_count DESC
	
	/* Copy and Paste the Result Below:
			+------------+--------------+
		| city       | review_count |
		+------------+--------------+
		| Las Vegas  |         3873 |
		| Montréal   |         1757 |
		| Gilbert    |         1549 |
		| Las Vegas  |         1410 |
		| Las Vegas  |         1389 |
		| Las Vegas  |         1252 |
		| Las Vegas  |         1116 |
		| Las Vegas  |         1084 |
		| Las Vegas  |          961 |
		| Gilbert    |          902 |
		| Las Vegas  |          864 |
		| Scottsdale |          823 |
		| Las Vegas  |          821 |
		| Las Vegas  |          786 |
		| Henderson  |          785 |
		| Toronto    |          778 |
		| Las Vegas  |          768 |
		| Las Vegas  |          758 |
		| Scottsdale |          726 |
		| Cleveland  |          723 |
		| Las Vegas  |          720 |
		| Charlotte  |          715 |
		| Phoenix    |          711 |
		| Las Vegas  |          706 |
		| Phoenix    |          700 |
		+------------+--------------+
		(Output limit exceeded, 25 of 10000 total rows shown)
	*/
	
/* 6. Find the distribution of star ratings to the business in the following cities: */

	i. Avon

		-- SQL code used to arrive at answer:
		
			SELECT city,
				AVG(stars) AS star_rating,
				review_count
			FROM business
			WHERE city = 'Avon'
			GROUP BY city;

		-- Copy and Paste the Resulting Table Below (2 columns – star rating and count):
		
			+------+-------------+--------------+
			| city | star_rating | review_count |
			+------+-------------+--------------+
			| Avon |        3.45 |           17 |
			+------+-------------+--------------+

	ii. Beachwood

		-- SQL code used to arrive at answer:
		
			SELECT city,
				AVG(stars) AS star_rating,
				review_count
			FROM business
			WHERE city = 'Beachwood'
			GROUP BY city;

		-- Copy and Paste the Resulting Table Below (2 columns – star rating and count):

			+-----------+---------------+--------------+
			| city      |   star_rating | review_count |
			+-----------+---------------+--------------+
			| Beachwood | 3.96428571429 |            4 |
			+-----------+---------------+--------------+		


/* 7. Find the top 3 users based on their total number of reviews: */
		
	-- SQL code used to arrive at answer:
	
		SELECT name,
			review_count
		FROM user
		ORDER BY review_count DESC
		LIMIT 3
		
	-- Copy and Paste the Result Below:
		+--------+--------------+
		| name   | review_count |
		+--------+--------------+
		| Gerald |         2000 |
		| Sara   |         1629 |
		| Yuri   |         1339 |
		+--------+--------------+

/* 8. Does posing more reviews correlate with more fans? */

	-- Please explain your findings and interpretation of the results:
	/*	Posting more reviews does not directly correlate with more fans. 

		The three users with the highest number	of fans have all posted fewer reviews than the three users with the most reviews. 
		
		Whats more is that the three users with the most reviews do not even appear in the top 10 of users with the most fans.
		
		The top ten users with the most reviews:
					+-----------+--------------+------+
					| name      | review_count | fans |
					+-----------+--------------+------+
					| Gerald    |         2000 |  253 |
					| Sara      |         1629 |   50 |
					| Yuri      |         1339 |   76 |
					| .Hon      |         1246 |  101 |
					| William   |         1215 |  126 |
					| Harald    |         1153 |  311 |
					| eric      |         1116 |   16 |
					| Roanna    |         1039 |  104 |
					| Mimi      |          968 |  497 |
					| Christine |          930 |  173 |
					+-----------+--------------+------+
		The top ten users with the most fans:
					+-----------+--------------+------+
					| name      | review_count | fans |
					+-----------+--------------+------+
					| Amy       |          609 |  503 |
					| Mimi      |          968 |  497 |
					| Harald    |         1153 |  311 |
					| Gerald    |         2000 |  253 |
					| Christine |          930 |  173 |
					| Lisa      |          813 |  159 |
					| Cat       |          377 |  133 |
					| William   |         1215 |  126 |
					| Fran      |          862 |  124 |
					| Lissa     |          834 |  120 |
					+-----------+--------------+------+
	*/

	
/* 9. Are there more reviews with the word "love" or with the word "hate" in them? */

	Answer: There were far more who used the word "love" in their review (1780) compared to the
			number that used "hate" (232)

	
	--SQL code used to arrive at answer:
		SELECT COUNT(text) AS NumberofHate
		FROM review
		WHERE text LIKE '%hate%';
	
		SELECT COUNT(text) AS NumberofLove
		FROM review
		WHERE text LIKE '%love%';
	
/* 10. Find the top 10 users with the most fans: */

	-- SQL code used to arrive at answer:
		SELECT name,
			review_count,
			fans
		FROM user
		ORDER BY fans DESC
		LIMIT 10;
	
	-- Copy and Paste the Result Below:
	
		+-----------+--------------+------+
		| name      | review_count | fans |
		+-----------+--------------+------+
		| Amy       |          609 |  503 |
		| Mimi      |          968 |  497 |
		| Harald    |         1153 |  311 |
		| Gerald    |         2000 |  253 |
		| Christine |          930 |  173 |
		| Lisa      |          813 |  159 |
		| Cat       |          377 |  133 |
		| William   |         1215 |  126 |
		| Fran      |          862 |  124 |
		| Lissa     |          834 |  120 |
		+-----------+--------------+------+
	
		
  -----------------------------------
--| Part 2: Inferences and Analysis |--
  -----------------------------------

/* 1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating.Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. */

-- My choices for further analysis
		City: Scottsdale
		Category: Soul Food
		4.0 - 5.0 stars = 'Top Rated'
		2.0 - 3.9 stars = 'Average Rating'
		1.0 - 1.9 stars = 'Low Rating'

** NOTE REGARDING 'StarCategories': Values are derived from a count of businesses that have a finalized star rating independant of the review count. This means that the total count of these queries should amount back to the total amount of businesses in the database (10,000).**

--- Summary Data ---
Average Soul Food Rating: 3.75 ('Top Rated' Category)
Average Scottsdale Rating: 3.95 ('Average Rating' Category)

	-- Scottsdale
		-- Spread of ratings in the city of Scottsdale
			+-------------+-----------------+
			| Star_Rating | Count_Of_Rating |
			+-------------+-----------------+
			|         5.0 |             137 |
			|         4.5 |              86 |
			|         4.0 |             102 |
			|         3.5 |              63 |
			|         3.0 |              41 |
			|         2.5 |              34 |
			|         2.0 |              19 |
			|         1.5 |              10 |
			|         1.0 |               5 |
			+-------------+-----------------+
			((Total amount of rated businesses: 395))

			-- Top 
			Scottsdale 'Top Rated' businesses: 188
			Scottsdale 5 star businesses: 137 (2,094 total reviews)
			Scottsdale 4 star businesses: 102 (10,594 total reviews)
			-- Average
			Scottsdale 'Average Rating' businesses: 157 
			Scottsdale 3 star businesses: 41 (6,730 total reviews)
			Scottsdale 2 star businesses: 19 (1,050 total reviews)
			--	Low
			Scottsdale 'Low Rating' businesses: 15
			Scottsdale 1 star businesses: 5 (146 total reviews)
		Total number of Yelp reviews in Scottsdale: 20,614

-- Soul Food
	-- There are only two 'Soul Food' businesses
		+---------------+-------------------------------+-----------+-------+----------------+
		| city          | name                          | category  | stars | StarCategory   |
		+---------------+-------------------------------+-----------+-------+----------------+
		| Phoenix       | Charlie D's Catfish & Chicken | Soul Food |   4.5 | Top Rated      |
		| North Randall | Oinky's Pork Chop Heaven      | Soul Food |   3.0 | Average Rating |
		+---------------+-------------------------------+-----------+-------+----------------+

/* i. Do the two groups you chose to analyze have a different distribution of hours? */
	The businesses in Scotssdale with listed hours show much more variablitiy in their hours while the 'Soul Food' businesses have much more consistant hours.
	Opening times remain largely the same across all businesses, with the only exceptions coming on weekends.
	In fact the only changes in opening time occured on Sundays.
	'The Cider Mill' in Scottsdale and the other 'Charlie Ds Catfish & Chicken' a Soul Food business were the only two businesses with fluctuation in opening time.
	Closing times displayed the highest range of variablitiy across the entire dataset, but largely for businesses in Scottsdale.
	Soul Food businesses generally did not change their closing times with only one exception on a single day.
	'Charlie Ds Catfish & Chicken' had the only closing and opening time fluctuation for a Soul Food business occuring all on Sunday.
	Two businesses did not have any weekly changes to their hours: 'Scent From Above Company' in Scottsdale and the Soul Food business 'Oinkys Pork Chop Heaven'

/* ii. Do the two groups you chose to analyze have a different number of reviews? */
    Both groups show very different sizes of reviews due to the wide range in sample sizes. 
	There have been 20,614 reviews in the city of Scottsdale, and there have been 10 reviews for the 'Soul Food' business category.
         
/* iii. Are you able to infer anything from the location data provided between these two groups? Explain. */
	There is nothing to infer based off of location since both of the two 'Soul Food' businesses are located in seperate cities (North Randall, and Phoenix)

	Attempting to match the constraints of the two 'Soul Food' businesses to the larger sample of Scottsdale businesses produced no crossover of latitude or longitude.

/* SQL code used for analysis: */
-- Creating a categorization system for star numbers for ease of analysis
	SELECT city,
		name,
		stars,
		--c.category
		CASE
			WHEN stars >= 4 AND stars <= 5 THEN 'Top Rated'
			WHEN stars >= 3 AND stars < 4 THEN 'Average Rating'
			WHEN stars >= 2 AND stars < 3 THEN 'Average Rating'
			WHEN stars >= 1 AND stars < 2 THEN 'Low Rating'
			ELSE 'Not Relevant'
		END AS 'StarCategory'
		FROM business
		--FROM category c INNER JOIN business b ON c.business_id = b.id
		WHERE city = 'Scottsdale'
		ORDER BY stars;

-- Finding spread of star ratings in Scotssdale
	-- Identifying the inputs in 'stars'
		SELECT DISTINCT stars
		FROM business
		WHERE city = 'Scottsdale'
		ORDER BY stars desc

	-- Count organized around a single star value
		SELECT stars,
			COUNT(stars)
		FROM business
		WHERE city = 'Scottsdale' AND stars = 5
		GROUP BY stars

	-- Summary view of star input counts
		SELECT stars,
			COUNT(stars)
		FROM business
		WHERE city = 'Scottsdale'
		GROUP BY stars
		ORDER BY stars desc
	
-- Sample of joining the hours with buisness (Question i.) 

	SELECT *
	FROM business b INNER JOIN hours h ON b.id = h.business_id
	WHERE b.city = 'Scottsdale'
-- (Question i.) Analyzing hours for each group 
	-- Scottsdale
		SELECT b.city,
			b.name,
			h.hours,
			SUBSTR(hours, 1, 3) dayopen
			--SUBSTR(hours, CHARINDEX('|',hours)+1, LEN(hours)) timeopen
			--SUBSTR(hours, POSITION('|',hours)+1, LEN(hours)) timeopen
			--SUBSTR(hours, LEGNTH(hours) - ) timeopen
			--None of the above options work because we are using SQLite
		FROM business b 
			INNER JOIN category c ON c.business_id = b.id 
			INNER JOIN hours h ON b.id = h.business_id
		WHERE city = 'Scottsdale';

		+------------+--------------------------+-----------------------+
		| city       | name                     | hours                 |
		+------------+--------------------------+-----------------------+
		| Scottsdale | Taliesin West            | Monday|8:30-14:30     | 
		| Scottsdale | Taliesin West            | Tuesday|8:30-17:00    | 
		| Scottsdale | Taliesin West            | Friday|8:30-20:00     | 
		| Scottsdale | Taliesin West            | Wednesday|8:30-17:00  | 
		| Scottsdale | Taliesin West            | Thursday|8:30-14:30   | 
		| Scottsdale | Taliesin West            | Sunday|8:30-15:00     | 
		| Scottsdale | Taliesin West            | Saturday|8:30-15:00   | 

		| Scottsdale | The Cider Mill           | Monday|10:00-18:00    |
		| Scottsdale | The Cider Mill           | Tuesday|10:00-18:00   |
		| Scottsdale | The Cider Mill           | Friday|10:00-20:00    | 
		| Scottsdale | The Cider Mill           | Wednesday|10:00-18:00 | 
		| Scottsdale | The Cider Mill           | Thursday|10:00-20:00  |
		| Scottsdale | The Cider Mill           | Sunday|11:00-16:00    |
		| Scottsdale | The Cider Mill           | Saturday|10:00-20:00  |

		| Scottsdale | Scent From Above Company | Friday|6:00-16:00     | 
		| Scottsdale | Scent From Above Company | Tuesday|6:00-16:00    |
		| Scottsdale | Scent From Above Company | Thursday|6:00-16:00   |
		| Scottsdale | Scent From Above Company | Wednesday|6:00-16:00  |
		| Scottsdale | Scent From Above Company | Monday|6:00-16:00     |
		+------------+--------------------------+-----------------------+

	-- Soul Food
		SELECT b.city,
			b.name,
			h.hours,
			SUBSTR(hours, 1, 3) dayopen
		FROM business b 
			INNER JOIN category c ON c.business_id = b.id 
			INNER JOIN hours h ON b.id = h.business_id
		WHERE c.category = 'Soul Food';
		+---------------+-------------------------------+-----------------------+---------+
		| city          | name                          | hours                 | dayopen |
		+---------------+-------------------------------+-----------------------+---------+
		| North Randall | Oinky's Pork Chop Heaven      | Monday|6:00-23:00     | Mon     |
		| North Randall | Oinky's Pork Chop Heaven      | Tuesday|6:00-23:00    | Tue     |
		| North Randall | Oinky's Pork Chop Heaven      | Friday|6:00-23:00     | Fri     |
		| North Randall | Oinky's Pork Chop Heaven      | Wednesday|6:00-23:00  | Wed     |
		| North Randall | Oinky's Pork Chop Heaven      | Thursday|6:00-23:00   | Thu     |
		| North Randall | Oinky's Pork Chop Heaven      | Sunday|6:00-23:00     | Sun     |
		| North Randall | Oinky's Pork Chop Heaven      | Saturday|6:00-23:00   | Sat     |

		| Phoenix       | Charlie D's Catfish & Chicken | Monday|11:00-18:00    | Mon     |
		| Phoenix       | Charlie D's Catfish & Chicken | Tuesday|11:00-18:00   | Tue     |
		| Phoenix       | Charlie D's Catfish & Chicken | Friday|11:00-18:00    | Fri     |
		| Phoenix       | Charlie D's Catfish & Chicken | Wednesday|11:00-18:00 | Wed     |
		| Phoenix       | Charlie D's Catfish & Chicken | Thursday|11:00-18:00  | Thu     |
		| Phoenix       | Charlie D's Catfish & Chicken | Sunday|13:00-16:00    | Sun     |
		| Phoenix       | Charlie D's Catfish & Chicken | Saturday|11:00-18:00  | Sat     |
		+---------------+-------------------------------+-----------------------+---------+
-- (Question ii.) Analyzing the volume of reviews for each group
	-- Scottsdale
	SELECT SUM(review_count) AS Number_of_Reviews
	FROM business
	WHERE city = 'Scottsdale'
	
	-- Soul Food
	SELECT SUM(review_count) AS Number_of_Reviews
	FROM category c INNER JOIN business b ON c.business_id = b.id
	WHERE category = 'Soul Food';

-- (Question iii.) Analyzing location data for inference
	-- Scottsdale lat. and long. (trying to adjust for Soul Food lat and long)
		SELECT DISTINCT b.name,
			b.address,
			b.latitude,
			b.longitude
		FROM business b 
			--INNER JOIN category c ON c.business_id = b.id 
		WHERE city = 'Scottsdale'
			AND latitude < 42
			AND latitude > 33
			AND longitude < 113
			AND longitude > 81;

		+------+---------+----------+-----------+
		| name | address | latitude | longitude |
		+------+---------+----------+-----------+
		+------+---------+----------+-----------+
		(Zero rows)


	-- Soul Food lat. and long.
		SELECT DISTINCT b.name,
			b.latitude,
			b.longitude
		FROM business b 
			INNER JOIN category c ON c.business_id = b.id 
		WHERE c.category = 'Soul Food';

		+-------------------------------+----------+-----------+
		| name                          | latitude | longitude |
		+-------------------------------+----------+-----------+
		| Oinky's Pork Chop Heaven      |  41.4352 |  -81.5214 |
		| Charlie D's Catfish & Chicken |  33.4468 |  -112.057 |
		+-------------------------------+----------+-----------+

-- Taking a look at the highest rated businesses in Scottsdale

	SELECT name,
		review_count,
		stars,
		city,
		state
	FROM business
	WHERE city = 'Scottsdale'
	ORDER BY stars DESC, review_count DESC;

-- A count of Scottsdale businesses rated '5'

	SELECT COUNT(*)
	FROM business
	WHERE city = 'Scottsdale' AND stars = '5';

-- Calculating review numbers across different star ratings

	SELECT SUM(review_count) AS Number_of_Reviews
	FROM business
	WHERE city = 'Scottsdale' AND stars >= 3 AND stars < 4

	SELECT SUM(review_count) AS Number_of_Reviews
	FROM business
	WHERE city = 'Scottsdale' AND stars >= 2 AND stars < 3

-- Calculating the total number of reviews in Scottsdale

	SELECT SUM(review_count) AS Total_Scottsdale_Reviews
	FROM business
	WHERE city = 'Scottsdale'


-- Calculating the total volume of businesses with reviews in the city of Scottsdale, AZ

	SELECT COUNT(review_count) AS Total_Scottsdale_Reviews
	FROM business
	WHERE city = 'Scottsdale'

-- An average rating for the city of Scottsdale with accompanying star category 

	
	SELECT city,
		AVG(stars) AS AverageRating,
	CASE
		WHEN stars < 4 AND stars >= 2 THEN 'Average Rating'
		WHEN stars >= 4 THEN 'Top Rated'
		ELSE 'Low Rating'
	END AS 'StarCategories'
	FROM business
	WHERE city = 'Scottsdale'
	GROUP BY city;

---------
-- Joining in order to analyze the 'Soul' food category with our previous categorization system for star numbers
	SELECT b.city,
		b.name,
		c.category,
		b.stars,
	CASE
		WHEN stars >= 4 AND stars <= 5 THEN 'Top Rated'
		WHEN stars >= 3 AND stars < 4 THEN 'Average Rating'
		WHEN stars >= 2 AND stars < 3 THEN 'Average Rating'
		WHEN stars >= 1 AND stars < 2 THEN 'Low Rating'
		ELSE 'Not Relevant'
		END AS 'StarCategory'
	FROM category c INNER JOIN business b ON c.business_id = b.id
	WHERE c.category = 'Soul Food'
	ORDER BY stars DESC;

---------
-- I would have used both of the queries above to create views for further querying but was limited by using the in-browser querying with Coursera (this also might be because of SQLite). Here is what it would have looked like:
	CREATE VIEW Scottsdale_Rating
	AS
		SELECT city,
			AVG(stars) AS AverageRating,
		CASE
			WHEN stars < 2 THEN 'Low Rating'
			WHEN stars < 4 AND stars >= 2 THEN 'Average Rating'
			WHEN stars >= 4 THEN 'Top Rated'
		END AS 'StarCategories'
		FROM business
		WHERE city = 'Scottsdale'
		GROUP BY city;

	CREATE VIEW Soul_Food_Rating
	AS
		SELECT
			c.category,
		AVG(b.stars) AS AverageRating,
		CASE
			WHEN stars < 2 THEN 'Low Rating'
			WHEN stars < 4 AND stars >= 2 THEN 'Average Rating'
			WHEN stars >= 4 THEN 'Top Rated'
		END AS 'Star_Category'
		FROM category c INNER JOIN business b ON c.business_id = b.id
		WHERE c.category = 'Soul Food'
		GROUP BY c.category;




---------
---------
---------

/* 2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer. */

-- Summary Data --
	Closed businesses: 1,520 (35,261 reviews)
	Open businesses: 8,480 (269,300 reviews)
		(Total businesses: 10,000)

	Explore the following for analysis:
		1. number of reviews
		2. spread of stars
	
	For further analysis (if you so choose :D)
		4. category
		5. state
	
/* i. Difference 1: */
The disparity in number of reviews as it relates to closed vs. open businesses is quite vast. Here are two reasons that I would infer:
	1. There are more open businesses than closed businesses
	2. Open businesses are still generating new reviews and closed businesses are not

There is no limit to the ammount of reviews that any one business could potentially generate compared to another, but when a business is closed that progress is frozen in time creating a widening disparity between open and closed.

A great measure for further analysis would be the volume of reviews written during final three to four months of a business before it closes. Are there more reviews written (likely due to a potential flaw or vulnerabilty of their business), or would reviews plumet as a result of wanning interest by patrons?

Fortunatly the next difference will give some insight as it relates to this dataset!
         
/* ii. Difference 2: */
** NOTE: The following numbers are derived from a count of businesses that have a finalized star rating independant of the review count. This means that the total count of these queries should amount back to the total amount of businesses in the database (10,000).**

Unsuprisingly, open businesses had more 'top' ratings than closed businesses did, but what did suprise was the low volume of 'low' rating businesses that were closed. The largest grouping of ratings for closed businesses came from the 'average' category. Most likely this happened as a result of 'average' containing a wider spread of ratings (spanning two ratings!) skewing it slightly, but a mere 38 'low' rated businesses really displays just how far off my assumptions about review score were as they relates to businesses success. Based soley off of these numbers it looks like there is no discernable correlation between being rated 'low' and your business closing as it pertains to this dataset alone.

	Low Rated Open: 324
	Average Rated Open: 3,801
	Top Rated Open: 4,355
	-----
	Low Rated Closed: 38
	Average Rated Closed: 829
	Top Rated Closed: 653

         
/* SQL code used for analysis: */
	SELECT DISTINCT is_open
	FROM business

	SELECT COUNT(name)
	FROM business
	-- WHERE is_open = 0
	-- WHERE is_open = 1

-- Examining number of reviews 
	SELECT 
		CASE 
			WHEN is_open = 1 THEN 'Open'
			WHEN is_open = 0 THEN 'Closed'
			ELSE 'Unknown Status'
		END AS 'Open/Closed',
		SUM(review_count) AS Review_Count
	FROM business
	GROUP BY is_open
	ORDER BY Review_Count DESC;

		+-------------+--------------+
		| Open/Closed | Review_Count |
		+-------------+--------------+
		| Open        |      269,300 |
		| Closed      |       35,261 |
		+-------------+--------------+

-- Examining spread of stars
	SELECT COUNT(name) AS 'Low Rated & Open Businesses'
	FROM business
	WHERE is_open = 1
		AND stars < 2
		+-----------------------------+
		| Low Rated & Open Businesses |
		+-----------------------------+
		|                         324 |
		+-----------------------------+
	
	SELECT COUNT(name) AS 'Average Rated & Open Businesses'
	FROM business
	WHERE is_open = 1
		AND stars < 4 
		AND stars >= 2
		+---------------------------------+
		| Average Rated & Open Businesses |
		+---------------------------------+
		|                            3801 |
		+---------------------------------+

	SELECT COUNT(name) AS 'Top Rated & Open Businesses'
	FROM business
	WHERE is_open = 1
		AND stars >= 4
		+-----------------------------+
		| Top Rated & Open Businesses |
		+-----------------------------+
		|                        4355 |
		+-----------------------------+

	SELECT COUNT(name) AS 'Low Rated & Closed Businesses'
	FROM business
	WHERE is_open = 0
		AND stars < 2
		+-------------------------------+
		| Low Rated & Closed Businesses |
		+-------------------------------+
		|                            38 |
		+-------------------------------+

	SELECT COUNT(name) AS 'Average Rated & Closed Businesses'
	FROM business
	WHERE is_open = 0
		AND stars < 4 
		AND stars >= 2
		+-----------------------------------+
		| Average Rated & Closed Businesses |
		+-----------------------------------+
		|                               829 |
		+-----------------------------------+

	SELECT COUNT(name) AS 'Top Rated & Closed Businesses'
	FROM business
	WHERE is_open = 0
		AND stars >= 4
		+-------------------------------+
		| Top Rated & Closed Businesses |
		+-------------------------------+
		|                           653 |
		+-------------------------------+


---------
---------
---------
	
/* 3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis. */

/* Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. */

-- Provide answers, in-line, to all of the following: 
	
/* i. Indicate the type of analysis you chose to do: */
         
         
/* ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data: */
                           
                  
/* iii. Output of your finished dataset: */
         
         
/* iv. Provide the SQL code you used to create your final dataset: */







