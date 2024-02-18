DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

INSERT INTO teams (name, city)
VALUES
('Atlanta United FC', 'Atlanta'),
('Charlotte FC', 'Charlotte'),
('Toronto FC', 'Toronto');

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO referees (name)
VALUES 
('Pablo Gaston Echavarria'), 
('Dario Humberto Herrera'), 
('Facundo Tello');

CREATE TABLE players 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    dob DATE NOT NULL,
    team_id INTEGER REFERENCES teams
);

INSERT INTO players (name, dob, team_id)
VALUES
('Brad Guzan', '09-09-1984', 1),
('Josh Cohen', '08-08-1992', 1),
('Ben Bender', '03-07-2001', 2),
('Guzman Corujo', '08-02-1996', 2),
('Sean Johnson', '05-31-1989', 3);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE
);

INSERT INTO seasons (start_date, end_date)
VALUES 
('02-01-2023', '10-21-2023'),
('02-01-2024', '12-07-2024');

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    match_date DATE,
    season_id INTEGER REFERENCES seasons,
    referee_id INTEGER REFERENCES referees
);

INSERT INTO matches (home_team_id, away_team_id, match_date, season_id, referee_id)
VALUES 
(1, 2, '08-09-2023', 1, 3),
(3, 2, '08-27-2023', 1, 2);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT NOT NULL
);

INSERT INTO results (match_id, team_id, result)
VALUES 
(1, 1, 'Lost'),
(1, 2, 'Won'),
(2, 3, 'Won'),
(2, 2, 'Lost');

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    score INTEGER
);

INSERT INTO goals (player_id, match_id, score)
VALUES
(1, 1, 2),
(2, 1, 1),
(3, 1, 3),
(4, 1, 2),
(4, 2, 1),
(3, 2, 1),
(5, 2, 4);

CREATE TABLE rankings
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    team_id INTEGER REFERENCES teams
);

INSERT INTO rankings (player_id, match_id, team_id)
VALUES
(5, 2, 3),
(3, 1, 2),
(1, 1, 1),
(4, 1, 2);



