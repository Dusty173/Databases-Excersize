-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space
CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO galaxies (name) VALUES ('Milky Way');


CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies
);

INSERT INTO stars (name, galaxy_id)
VALUES
('Sol / The sun', 1),
('Proxima Centauri', 1),
('Gliese 876', 1);


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around INTEGER REFERENCES stars,
  orbital_period_in_years FLOAT
);

INSERT INTO planets (name, orbits_around, orbital_period_in_years)
VALUES
('Earth', 1, 1),
('Mars', 1, 1.88),
('Venus', 1, 0.62),
('Neptune', 1, 164.8),
('Proxima Centauri b', 2, 0.03),
('Gliese 876 b', 3, 0.23);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  moon TEXT
);

INSERT INTO moons (planet_id, moon)
VALUES 
(1, 'Luna / The Moon'),
(2, '{"Phobos", "Deimos"}'),
(3, 'No Celestial Objects Orbit Here'),
(4, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
(5, 'No Celestial Objects Orbit Here'),
(6, 'No Celestial Objects Orbit Here');