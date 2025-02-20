--Select 2
--  Название и продолжительность самого длительного трека.
SELECT name, duration FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration FROM tracks
WHERE duration > (60 * 3.5);

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name FROM collections
WHERE release_year BETWEEN 2018 AND 2020;

--    Исполнители, чьё имя состоит из одного слова.
SELECT name FROM performers
WHERE name NOT LIKE '% %' OR name NOT LIKE '%_%';


--Название треков, которые содержат слово «мой» или «my».
SELECT name FROM tracks
WHERE name LIKE '%My%';


-- Select 3
--Количество исполнителей в каждом жанре.
SELECT genres.name AS genres_name, count(performers_genres.genre_id) AS count_performers FROM performers_genres, genres
WHERE genres.genre_id = performers_genres.genre_id 
GROUP BY name 


-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(tracks.name) AS count_tracks FROM tracks, albums
WHERE tracks.album_id = albums.album_id AND albums.release_year BETWEEN 2019 AND 2020

-- Так удобнее сравнивать...
--SELECT tracks.name AS tracks_name, albums.name AS albums_name, albums.release_year FROM tracks, albums
--WHERE tracks.album_id = albums.album_id AND albums.release_year BETWEEN 2019 AND 2020

-- Средняя продолжительность треков по каждому альбому.
SELECT albums.name AS track_name ,  ROUND(AVG(tracks.duration), 1) AS average_duration FROM albums
JOIN tracks ON albums.album_id = tracks.album_id 
GROUP BY albums.album_id 

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT performers.name AS performers_name, albums.name AS albums_name
FROM performers_albums 
JOIN performers ON performers_albums.performer_id = performers.performer_id
JOIN albums ON performers_albums.album_id = albums.album_id
WHERE NOT albums.release_year = 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT DISTINCT collections.name FROM collections
JOIN tracks_collections ON collections.collection_id = tracks_collections.collection_id
JOIN tracks ON tracks_collections.track_id = tracks.track_id
JOIN albums ON tracks.album_id = albums.album_id 
JOIN performers_albums ON albums.album_id = performers_albums.album_id 
JOIN performers ON performers_albums.performer_id = performers.performer_id 
WHERE performers.name = 'BTS'




-- Select 4

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.name AS album_name, COUNT(g.genre_id) AS count_genre FROM albums a
JOIN performers_albums pa ON a.album_id = pa.album_id
JOIN performers p ON pa.performer_id = p.performer_id
JOIN performers_genres pg ON p.performer_id = pg.performer_id
JOIN genres g ON pg.genre_id = g.genre_id
GROUP BY a.name
HAVING COUNT(g.genre_id) > 1


-- Наименования треков, которые не входят в сборники.
SELECT tracks.name AS track_name, tracks.track_id  FROM tracks
LEFT JOIN tracks_collections ON tracks.track_id = tracks_collections.track_id 
WHERE tracks_collections.track_id IS NULL

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
-- НЕ смог выполнить это задание, так как нет прямой связи performers и tracks. 
-- Если к ним идти через performers_albums, то изза этого получается, что 1 track исполняет несколько
-- performers, потому, что некоторые albums составные
-- Мне кажется необходимо сделать связь tracks и albums, иначе вот такой результат...
SELECT DISTINCT tracks.name AS track_name, tracks.duration, performers.name AS performer_name FROM performers
JOIN performers_albums ON performers.performer_id = performers_albums.album_id 
JOIN albums ON performers_albums.performer_id = albums.album_id 
JOIN tracks ON albums.album_id = tracks.album_id 
WHERE tracks.duration = (SELECT MIN(tracks.duration) FROM tracks)

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT albums.name AS album_name, COUNT(tracks.track_id) AS count_tracks FROM albums
JOIN tracks ON tracks.album_id = albums.album_id
GROUP BY albums.name 
HAVING COUNT(tracks.track_id) = (
	SELECT MIN(track_count) 
	FROM (
		SELECT album_id, COUNT(track_id) AS track_count
		FROM tracks
		GROUP BY album_id))





   
    
   

    
