SELECT album_name, album_year FROM album
WHERE album_year >= 2018

SELECT song_name, song_length FROM song
ORDER BY song_length DESC  
LIMIT 1;

SELECT song_name, song_length FROM song
WHERE song_length > '00:03:30'
ORDER BY song_length;

SELECT collection_name FROM collection
WHERE collection_year BETWEEN 2018 AND 2020;

SELECT artist_name FROM artist
WHERE artist_name NOT LIKE '% %';

SELECT song_name FROM song
WHERE STRING_TO_ARRAY(LOWER(song_name), ' ') && ARRAY['my'];

---количество исполнителей в каждом жанре
SELECT DISTINCT genre_name, COUNT(DISTINCT artist_id) FROM artist_genre ag
JOIN genre g ON ag.genre_id = g.id 
JOIN artist a ON ag.artist_id = a.id
GROUP BY genre_name;

--- количество песен в альбомах с 2019 по 2020
SELECT COUNT(song_name) FROM song s 
JOIN album a ON s.album_id = a.id
WHERE a.album_year BETWEEN 2019 AND 2020;

--- средняя продолжительность альбома
SELECT album_name, AVG(song_length) FROM album a
JOIN song s ON s.album_id = a.id
GROUP BY album_name;

---исполнители без альбомов в 2020
SELECT DISTINCT artist_name FROM artist a
JOIN artist_album aa ON aa.artist_id = a.id 
JOIN album a2 ON a2.id = aa.album_id  
WHERE a2.album_year != 2020;

--- поиск всех сборников по исполнителю
SELECT collection_name FROM collection c 
JOIN song_collection sc ON sc.collection_id = c.id
JOIN song s ON s.id = sc.song_id 
JOIN album a ON a.id = s.album_id 
JOIN artist_album aa ON aa.album_id = a.id 
JOIN artist a2 ON a2.id = aa.artist_id
WHERE a2.artist_name = 'Queen';

--- альбомы где у исполнителя более 1 жанра
SELECT DISTINCT a.album_name, a2.artist_name FROM album a
JOIN artist_album aa ON a.id = aa.album_id 
JOIN artist a2 ON aa.artist_id = a2.id
JOIN artist_genre ag ON ag.artist_id = a2.id
JOIN genre g ON ag.genre_id = g.id
GROUP BY a.album_name, a2.artist_name 
HAVING count(g) > 1 ;

---список песен не входящих в альбомы
SELECT song_name FROM song s 
LEFT JOIN song_collection sc ON s.id = sc.song_id
WHERE sc.song_id IS NULL;

--- поиск исполнителя с самым коротким трэком
SELECT a.artist_name, s.song_length FROM artist a 
JOIN artist_album aa ON aa.artist_id = a.id 
JOIN album a2 ON a2.id = aa.album_id 
JOIN song s ON s.album_id = a2.id 
WHERE s.song_length = (
	SELECT MIN(song_length) FROM song)
ORDER BY a.artist_name, s.song_length;

--- поиск альбомов с наименьшим количеством треков
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
