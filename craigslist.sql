DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO regions (name) VALUES ('Seattle'),('San-Francisco'),('Atlanta');

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    pref_region_id INTEGER REFERENCES regions
);

INSERT INTO users (username, password, pref_region_id)
VALUES ('guy1', 'abcdef', 1), ('ironman', 'jarvis', 2), ('Tron', 'fightforus3rs', 3);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL
);

INSERT INTO categories (cat_name)
VALUES ('cars'), ('cats'), ('light-cycles');


CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    user_id INTEGER REFERENCES users,
    category_id INTEGER REFERENCES categories,
    region_id INTEGER REFERENCES regions
);

INSERT INTO posts (title, description, user_id, category_id, region_id)
VALUES ('Why are Lightcycles so cool', 'Just turn the lights off or drive at night, it looks cool.', 3, 3, 2);