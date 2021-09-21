DESCRIBE albums;
-- 3.
-- a. There are 6 rows in the album table
-- b. There are 240 unique names in the album table
-- c. id is the primary key of the albums table
SELECT max(release_date) as newst_release, min(release_date) as oldest_release FROM albums;
-- d. oldst = 1967 and newst = 2011
-- 4
 SELECT name FROM albums WHERE artist = 'Pink Floyd';
 -- a.
 -- The Dark Side of the Moon
 -- The Wall 
 SELECT release_date as year FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band'; 
-- b. The year Sgt. Pepper's Lonely Hearts Club Band was 1967
SELECT name FROM albums WHERE artist = 'Pink Floyd';

SELECT genre FROM albums WHERE name = 'Nevermind';
-- c. The genre for the album Nevermind is = Grunge, Alternative rock

SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
-- d. Which albums were released in the 1990s

SELECT name FROM albums WHERE sales < 20;
-- e. Which albums had less than 20 million certified sales

SELECT name FROM albums WHERE genre = 'Rock';
-- f. All the albums with a genre of "Rock"d