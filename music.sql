-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
  
  

  
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO artists (name)
VALUES
('Alicia Keys'),
('Avril Lavigne'),
('Boyz II Men'),
('Bradley Cooper'),
('Christina Aguilera'),
('Destiny''Child'),
('Hanson'),
('Jay Z'),
('Juicy J'),
('Katy Perry'),
('Lady Gaga'),
('Maroon 5'),
('Mariah Cary'),
('Nickelback'),
('Queen'),
('No other Artist');
-- 16
CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO albums (name)
VALUES
('A Night at The Opera'),
('A Star Is Born'),
('Daydream'),
('Hands All Over'),
('Let Go'),
('Middle of Nowhere'),
('Prism'),
('Silver Side Up'),
('The Blueprint 3'),
('The Writing''s on the Wall');
-- 10
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO producers (name)
VALUES
('Al Shux'),
('Benjamin Rice'),
('Benny Blanco'),
('Cirkut'),
('Darkchild'),
('Dust Brothers'),
('Max Martin'),
('Rick Parashar'),
('Roy Thomas Baker'),
('Shellback'),
('Stephen Lironi'),
('The Matrix'),
('Walter Afanasieff'),
('No other producer');
-- 14

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  song TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist1_id INTEGER REFERENCES artists,
  artist2_id INTEGER REFERENCES artists,
  album_id INTEGER REFERENCES albums,
  producer1_id INTEGER REFERENCES producers,
  producer2_id INTEGER REFERENCES producers
);

INSERT INTO songs (song, duration_in_seconds, release_date, artist1_id, artist2_id, album_id, producer1_id, producer2_id)
VALUES
('MMMBop', 238, '04-15-1997', 7, 14, 6, 6, 11),
('Bohemian Rhapsody', 355, '10-31-1975', 15, 16, 1, 9, 14),
('One Sweet Day', 282, '11-14-1995', 13, 3, 3, 13, 14),
('Shallow', 216, '09-27-2018', 11, 4, 2, 2, 14),
('How You Remind Me', 223, '08-21-2001', 14, 16, 8, 8, 14),
('New York State of Mind', 276, '10-20-2009', 8, 1, 9, 1, 14),
('Dark Horse', 215, '12-17-2013', 10, 9, 7, 7, 4),
('Moves Like Jagger', 201, '06-21-2011', 12, 5, 4, 10, 3),
('Complicated', 244, '05-14-2002', 2, 16, 5, 12, 14),
('Say My Name', 240, '11-07-1999', 6, 16, 10, 5, 14);