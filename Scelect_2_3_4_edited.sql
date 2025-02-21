-- ОТРЕДАКТИРОВАНО
-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration FROM tracks
WHERE duration >=  (60 * 3.5);

-- ОТРЕДАКТИРОВАНО.
--Название треков, которые содержат слово «мой» или «my»
SELECT name FROM tracks
WHERE string_to_array(LOWER(tracks.name), ' ') && ARRAY['my', 'мой'];


-- ОТРЕДАКТИРОВАНО
-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT performers.name AS performers_name
FROM performers
WHERE performers.name NOT IN (
	SELECT performers.name FROM performers_albums
	JOIN performers ON performers_albums.performer_id = performers.performer_id
	JOIN albums ON performers_albums.album_id = albums.album_id
	WHERE albums.release_year = 2020);


--Отредактировано
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.name AS album_name, COUNT(g.genre_id) AS count_genre FROM albums a
JOIN performers_albums pa ON a.album_id = pa.album_id
JOIN performers p ON pa.performer_id = p.performer_id
JOIN performers_genres pg ON p.performer_id = pg.performer_id
JOIN genres g ON pg.genre_id = g.genre_id
GROUP BY a.name, p.performer_id 
HAVING COUNT(g.genre_id) > 1