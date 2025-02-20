INSERT INTO performers (name) VALUES
('The Weeknd'),
('Billie Eilish'),
('Adele'),
('BTS'),
('Coldplay'),
('Ed Sheeran');


INSERT INTO genres (name) VALUES
('Pop'),
('Rock'),
('Electronic');

INSERT INTO albums (name, release_year) VALUES
('After Hours', 2020),
('When We All Fall Asleep, Where Do We Go?', 2019),
('30', 2021),
('BE', 2020),
('Ghost Stories', 2014),
('Divide', 2017);

INSERT INTO tracks (album_id, name, duration) VALUES
(1, 'Blinding Lights', 200),
(1, 'Save Your Tears', 215),
(1, 'In Your Eyes', 230),
(3, 'Bad Guy', 185),
(2, 'Bury a Friend', 210),
(2, 'Everything I Wanted', 220),
(3, 'Easy On Me', 250),
(3, 'Oh My God', 245),
(3, 'Can I Get It', 235),
(4, 'Dynamite', 195),
(4, 'Life Goes On', 215),
(4, 'Butter', 185),
(5, 'Fix You', 260),
(5, 'Yellow', 230),
(5, 'The Scientist', 290),
(6, 'Shape of You', 235),
(6, 'Castle on the Hill', 240),
(6, 'Galway Girl', 210);


INSERT INTO collections  (name, release_year) VALUES
('Top Hits 2020', 2020),
('Pop Hits of the Decade', 2020),
('Electronic Anthems', 2019),
('Best of Rock', 2021);


INSERT INTO tracks_collections (collection_id, track_id) VALUES
(1, 1), 
(1, 4), 
(1, 5),  
(2, 2),  
(2, 3), 
(2, 6),  
(3, 8),  
(3, 11), 
(3, 15), 
(4, 10); 

INSERT INTO performers_albums (performer_id, album_id) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),  
(6, 5),  
(6, 6), 
(3, 4),
(4, 1),
(4, 2),
(4, 3);

INSERT INTO performers_genres (performer_id, genre_id) VALUES
(1, 1),  
(2, 1),  
(3, 1), 
(4, 1), 
(5, 2),  
(6, 1),  
(5, 3);  

