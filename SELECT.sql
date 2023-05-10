#select albums issued after 2018
SELECT album_name, album_year FROM album
WHERE album_year >= 2018

#select shortest song
SELECT song_name, song_length FROM song
ORDER BY song_length DESC  
LIMIT 1;

#select song longer than 03:30
SELECT song_name, song_length FROM song
WHERE song_length > '00:03:30'
ORDER BY song_length;

#select collections released between 2018 and 2020
SELECT collection_name FROM collection
WHERE collection_year BETWEEN 2018 AND 2020;

#select all artists with more than one name
SELECT artist_name FROM artist
WHERE artist_name NOT LIKE '% %';

#select all songs that has 'my' in the title
SELECT song_name FROM song
WHERE STRING_TO_ARRAY(LOWER(song_name), ' ') && ARRAY['my'];

#count artist in each genre
SELECT DISTINCT genre_name, COUNT(DISTINCT artist_id) FROM artist_genre ag
JOIN genre g ON ag.genre_id = g.id 
JOIN artist a ON ag.artist_id = a.id
GROUP BY genre_name;


#count all songs released between 2019 and 2020
SELECT COUNT(song_name) FROM song s 
JOIN album a ON s.album_id = a.id
WHERE a.album_year BETWEEN 2019 AND 2020;

#count avg album length
SELECT album_name, AVG(song_length) FROM album a
JOIN song s ON s.album_id = a.id
GROUP BY album_name;

#select artists without albums in 2020
SELECT DISTINCT artist_name FROM artist a
JOIN artist_album aa ON aa.artist_id = a.id 
JOIN album a2 ON a2.id = aa.album_id  
WHERE a2.album_year != 2020;

#select all collections by specific artist
SELECT collection_name FROM collection c 
JOIN song_collection sc ON sc.collection_id = c.id
JOIN song s ON s.id = sc.song_id 
JOIN album a ON a.id = s.album_id 
JOIN artist_album aa ON aa.album_id = a.id 
JOIN artist a2 ON a2.id = aa.artist_id
WHERE a2.artist_name = 'Queen';

#select albums where artist got more than 1 genre
SELECT DISTINCT a.album_name, a2.artist_name FROM album a
JOIN artist_album aa ON a.id = aa.album_id 
JOIN artist a2 ON aa.artist_id = a2.id
JOIN artist_genre ag ON ag.artist_id = a2.id
JOIN genre g ON ag.genre_id = g.id
GROUP BY a.album_name, a2.artist_name 
HAVING count(g) > 1 ;

#select all songs not in collections
SELECT song_name FROM song s 
LEFT JOIN song_collection sc ON s.id = sc.song_id
WHERE sc.song_id IS NULL;

#select artist with shortest song
SELECT a.artist_name, s.song_length FROM artist a 
JOIN artist_album aa ON aa.artist_id = a.id 
JOIN album a2 ON a2.id = aa.album_id 
JOIN song s ON s.album_id = a2.id 
WHERE s.song_length = (
	SELECT MIN(song_length) FROM song)
ORDER BY a.artist_name, s.song_length;

#select album with least song
SELECT album_name FROM album a 
JOIN artist_album aa ON a.id = aa.album_id
JOIN song s ON s.album_id = aa.album_id 
GROUP BY a.id 
HAVING COUNT(song_name) = (
	SELECT COUNT(s.id) FROM song s 
    JOIN album a ON a.id = s.album_id 
    GROUP BY a.album_name 
    ORDER BY COUNT(s.id) 
    LIMIT 1); 
