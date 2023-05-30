-- Collect all your queries here if you'd like!

SELECT * FROM artists; 

SELECT * FROM artists WHERE name = "Black Sabbath";

SELECT * FROM artists WHERE name LIKE  "%Black%";

CREATE TABLE IF NOT EXISTS fans (
	id INTEGER PRIMARY KEY,
	name TEXT
);

ALTER TABLE fans ADD COLUMN artist_id INTEGER; 

INSERT INTO fans 
(name, artist_id) 
VALUES ("myname", 174);

SELECT * FROM fans WHERE artist_id != 169; 
SELECT * FROM fans WHERE artist_id != (SELECT id FROM artists WHERE name = "Black Eyed Peas"); 

SELECT artists.name, albums.title 
FROM artists 
INNER JOIN albums 
ON artists.id = albums.artist_id; 

SELECT artists.name, albums.title, COUNT(tracks.album_id) as track_count 
FROM artists 
INNER JOIN albums 
ON artists.id = albums.artist_id
INNER JOIN tracks 
ON albums.id = tracks.album_id 
GROUP BY tracks.album_id
ORDER BY track_count DESC; 

SELECT DISTINCT artists.name
FROM artists 
JOIN albums 
ON artists.id = albums.artist_id 
JOIN tracks 
ON albums.id = tracks.album_id 
JOIN genres 
ON genres.id = tracks.genre_id 
WHERE genres.name = "Pop";

SELECT artists.name, COUNT(tracks.genre_id) AS genre_count
FROM artists 
JOIN albums 
ON artists.id = albums.artist_id
JOIN tracks 
ON albums.id = tracks.album_id
WHERE tracks.genre_id = 1   
GROUP BY artists.id
HAVING genre_count > 30 
ORDER BY genre_count DESC;