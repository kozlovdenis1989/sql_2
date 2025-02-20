
CREATE TABLE IF NOT EXISTS genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL );

CREATE TABLE IF NOT EXISTS performers (
	performer_id SERIAL PRIMARY KEY,
	name VARCHAR(200) NOT NULL );

CREATE TABLE IF NOT EXISTS performers_genres(
	performer_id INTEGER REFERENCES performers(performer_id),
	genre_id INTEGER REFERENCES genres(genre_id),
	CONSTRAINT pk PRIMARY KEY (performer_id, genre_id)
	);

CREATE TABLE IF NOT EXISTS albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year > 1800)
	);


CREATE TABLE IF NOT EXISTS performers_albums(
	performer_id INTEGER REFERENCES performers(performer_id),
	album_id INTEGER REFERENCES albums(album_id),
	CONSTRAINT pk1 PRIMARY KEY (performer_id, album_id)
	);

CREATE TABLE IF NOT EXISTS tracks (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(100)  NOT NULL,
	album_id INTEGER REFERENCES albums(album_id),
	duration INTEGER NOT NULL
	);

CREATE TABLE IF NOT EXISTS collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year > 1800) 
	);

CREATE TABLE IF NOT EXISTS tracks_collections(
	track_id INTEGER REFERENCES tracks(track_id),
	collection_id INTEGER REFERENCES collections(collection_id),
	CONSTRAINT pk3 PRIMARY KEY (track_id, collection_id)
	);

