-- IMDB SQL Project---------------------------------------

USE project_movie_database;

select * from movies;
select * from directors;

DESCRIBE movies;
DESCRIBE directors;

-- ---------------------------------------------------
-- QUESTIONS A) to J)
-- ---------------------------------------------------

-- a) Get all movie data
SELECT * FROM movies;

-- b) Get all director data
SELECT * FROM directors;

-- c) Check how many movies are present in IMDB
SELECT COUNT(*) AS total_movies FROM movies;

-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- e) Find all directors with name starting with S
SELECT * FROM directors
WHERE name LIKE 'S%';

-- f) Count female directors
SELECT COUNT(*) AS female_directors
FROM directors
WHERE gender = 1;

-- g) Find the name of the 10th first women director
SELECT name FROM directors
WHERE gender = 1
ORDER BY id
LIMIT 1 OFFSET 9;

-- h) What are the 3 most popular movies
SELECT title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

-- i) What are the 3 most bankable movies
SELECT title, revenue
FROM movies
ORDER BY revenue DESC
LIMIT 3;

-- j) What is the most awarded average vote since January 1st, 2000
SELECT title, vote_average, release_date
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

DESCRIBE directors;
DESCRIBE movies;

SELECT
    m.id,
    m.original_title,
    m.Director_id,
    d.id,
    d.name
FROM movies m
INNER JOIN directors d
ON m.Director_id = d.id
LIMIT 10;

-- Questions k) to m)

-- k) Which movie(s) were directed by Brenda Chapman?
SELECT
    d.Name,
    d.id,
    COUNT(m.id) AS total_movies
FROM directors d
LEFT JOIN movies m
    ON d.id = m.Director_id
WHERE d.Name = 'Brenda Chapman'
GROUP BY d.Name, d.id;

-- l) Which director made the most movies?
SELECT
    d.Name AS director_name,
    COUNT(m.id) AS total_movies
FROM directors d
INNER JOIN movies m
    ON d.id = m.Director_id
GROUP BY d.id, d.Name
ORDER BY total_movies DESC
LIMIT 1;

-- m) Which director is the most bankable?
SELECT
    d.Name AS director_name,
    SUM(m.revenue) AS total_revenue
FROM directors d
INNER JOIN movies m
    ON d.id = m.Director_id
GROUP BY d.id, d.Name
ORDER BY total_revenue DESC
LIMIT 1;

-- --------------------------------------------------------------------------------------------------------------------------------------
-- Note on Table Merging:

-- As per the project instructions, I attempted to merge the Movies and Directors tables by creating a new table. 
-- However, the CREATE TABLE command returned an Access Denied error due to insufficient database permissions. 
-- I contacted the DataMites team for assistance but did not receive a response before the submission deadline.
-- The relationship between both tables was successfully verified using SQL JOIN queries, and all assigned questions (A–M) were completed.
-- ---------------------------------------------------------------------------------------------------------------------------------------














