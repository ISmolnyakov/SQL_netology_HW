CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,  
	genre_name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,  
	artist_name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_genre (
 	genre_id INTEGER REFERENCES genre(id),
    artist_id INTEGER REFERENCES artist(id),
    CONSTRAINT pk_artist_genre PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,  
	album_name VARCHAR(80) NOT NULL,
	album_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS song (
	id SERIAL PRIMARY KEY,  
	album_id INTEGER REFERENCES album(id),
	song_name VARCHAR(80) NOT NULL,
	song_length TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_album (
	album_id INTEGER REFERENCES album(id),
    artist_id INTEGER REFERENCES artist(id),
    CONSTRAINT pk_artist_album PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,  
	collection_name VARCHAR(80) NOT NULL,
	collection_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS song_collection (
	song_id INTEGER REFERENCES song(id),
    collection_id INTEGER REFERENCES collection(id),
    CONSTRAINT pk_song_collection PRIMARY KEY (song_id, collection_id)
);
