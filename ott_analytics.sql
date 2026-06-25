USE ott_analytics;

SELECT COUNT(*) FROM content;
SELECT COUNT(*) FROM genres;
SELECT COUNT(*) FROM directors;
SELECT COUNT(*) FROM actors;
SELECT COUNT(*) FROM countries;
SELECT COUNT(*) FROM content_genres;
SELECT COUNT(*) FROM content_countries;
SELECT COUNT(*) FROM content_directors;
SELECT COUNT(*) FROM content_actors;

-- 1) Total Content
SELECT COUNT(*) AS total_titles
FROM content;

-- 2) Movies vs TV Shows
SELECT type,
       COUNT(*) AS total_titles
FROM content
GROUP BY type;

-- 3) Content Rating
SELECT rating,
       COUNT(*) AS total_titles
FROM content
GROUP BY rating
ORDER BY total_titles DESC;

-- 4) Content Added per year
SELECT YEAR(date_added) AS year_added,
       COUNT(*) AS total_titles
FROM content
GROUP BY YEAR(date_added)
ORDER BY year_added;

-- 5) Top Release Years
SELECT release_year,
COUNT(*) AS total_titles
FROM content
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 10;

-- 6) Top Genres
SELECT g.genre_name, COUNT(*) AS total_titles
FROM genres g
JOIN content_genres cg
ON g.genre_id=cg.genre_id
GROUP BY g.genre_name
ORDER BY total_titles DESC
LIMIT 10;

-- 7) Top Countries
SELECT co.country_name,
       COUNT(*) AS total_titles
FROM countries co
JOIN content_countries cc
ON co.country_id = cc.country_id
GROUP BY co.country_name
ORDER BY total_titles DESC
LIMIT 10;

-- 8) Top directors
SELECT d.director_name,
       COUNT(*) AS total_titles
FROM directors d
JOIN content_directors cd
ON d.director_id = cd.director_id
GROUP BY d.director_name
ORDER BY total_titles DESC
LIMIT 10;

-- 9) Top Actors
SELECT a.actor_name,
       COUNT(*) AS total_titles
FROM actors a
JOIN content_actors ca
ON a.actor_id = ca.actor_id
GROUP BY a.actor_name
ORDER BY total_titles DESC
LIMIT 10;

-- 10) Top Movie genres
SELECT g.genre_name,
       COUNT(*) AS movie_count
FROM genres g
JOIN content_genres cg
ON g.genre_id = cg.genre_id
JOIN content c
ON cg.content_id = c.content_id
WHERE c.type='Movie'
GROUP BY g.genre_name
ORDER BY movie_count DESC;

-- 11) Top TV Show Genres
SELECT g.genre_name,
       COUNT(*) AS tvshow_count
FROM genres g
JOIN content_genres cg
ON g.genre_id = cg.genre_id
JOIN content c
ON cg.content_id = c.content_id
WHERE c.type='TV Show'
GROUP BY g.genre_name
ORDER BY tvshow_count DESC;

-- 12) Country Producing with most Movies
SELECT co.country_name,
       COUNT(*) AS movie_count
FROM countries co
JOIN content_countries cc
ON co.country_id = cc.country_id
JOIN content c
ON cc.content_id = c.content_id
WHERE c.type='Movie'
GROUP BY co.country_name
ORDER BY movie_count DESC
LIMIT 10;

-- 13) Country Producing with most Tv Shows
SELECT co.country_name,
       COUNT(*) AS tv_count
FROM countries co
JOIN content_countries cc
ON co.country_id = cc.country_id
JOIN content c
ON cc.content_id = c.content_id
WHERE c.type='TV Show'
GROUP BY co.country_name
ORDER BY tv_count DESC
LIMIT 10;

-- 14) Movie Rating Distributions
SELECT rating,
       COUNT(*) AS movie_count
FROM content
WHERE type='Movie'
GROUP BY rating
ORDER BY movie_count DESC;

-- 15) TV Show Rating Distributions
SELECT rating,
       COUNT(*) AS tv_count
FROM content
WHERE type='TV Show'
GROUP BY rating
ORDER BY tv_count DESC;

-- 16) Genres Above Average Popularity
WITH genre_count AS
(
    SELECT g.genre_name,
           COUNT(*) AS total_titles
    FROM genres g
    JOIN content_genres cg
    ON g.genre_id=cg.genre_id
    GROUP BY g.genre_name
)
SELECT *
FROM genre_count
WHERE total_titles >
(
    SELECT AVG(total_titles)
    FROM genre_count
);

-- 17) Directors Above Average Productivity
WITH director_count AS
(
    SELECT c.director_id, d.director_name, COUNT(*) AS total_titles
    FROM content_directors c
    JOIN directors d
    ON c.director_id=d.director_id
    GROUP BY c.director_id
)
SELECT *
FROM director_count
WHERE total_titles >
(
    SELECT AVG(total_titles)
    FROM director_count
);

-- 18) Ranking Genres
SELECT genre_name,
       total_titles,
       RANK() OVER(ORDER BY total_titles DESC) AS genre_rank
FROM
(
    SELECT g.genre_name,
           COUNT(*) AS total_titles
    FROM genres g
    JOIN content_genres cg
    ON g.genre_id=cg.genre_id
    GROUP BY g.genre_name
) x;

-- 19) Ranking Countries
SELECT country_name,
       total_titles,
       DENSE_RANK() OVER(ORDER BY total_titles DESC) AS country_rank
FROM
(
    SELECT co.country_name,
           COUNT(*) AS total_titles
    FROM countries co
    JOIN content_countries cc
    ON co.country_id=cc.country_id
    GROUP BY co.country_name
) x;

-- 20) Running Total of Content Growth
SELECT release_year,
       yearly_titles,
       SUM(yearly_titles)
       OVER(ORDER BY release_year) AS cumulative_titles
FROM
(
    SELECT release_year,
           COUNT(*) AS yearly_titles
    FROM content
    GROUP BY release_year
) x;

-- 21) Directors Who Worked Across Multiple Genres
SELECT d.director_name,
       COUNT(DISTINCT cg.genre_id) AS genre_count
FROM directors d
JOIN content_directors cd
ON d.director_id = cd.director_id
JOIN content_genres cg
ON cd.content_id = cg.content_id
GROUP BY d.director_name
ORDER BY genre_count DESC
LIMIT 10;

-- 22) Average Number of Actors per Content
SELECT ROUND(AVG(actor_count),2) AS avg_actors
FROM
(
    SELECT content_id,
           COUNT(actor_id) AS actor_count
    FROM content_actors
    GROUP BY content_id
) x;