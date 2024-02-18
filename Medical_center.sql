DROP DATABASE IF EXISTS hospital;

CREATE DATABASE hospital;

\c hospital

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    field TEXT NOT NULL
);

INSERT INTO doctors (emp_name, field)
VALUES 
    ('John', 'Surgeon'),
    ('Bill', 'Psychiatry'),
    ('Alicia', 'Anesthesiology');

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NULL,
    dob DATE NOT NULL
);

INSERT INTO patients (patient_name, dob) 
VALUES 
    ('Anne', '10-12-1995'), 
    ('Donny', '12-12-1963'), 
    ('David', '08-04-1984');

CREATE TABLE sickness 
(
    id SERIAL PRIMARY KEY,
    sickness TEXT NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO sickness (sickness, description)
VALUES 
    ('FLU', 'Contagious respiratory illness caused by influenza viruses.'),
    ('Ear Infection', 'In an ear infection, narrow tubes that run from the middle ear to high in the back of the throat (eustachian tubes) can become swollen and blocked.'),
    ('Spontaneous Combustion', 'Occurs when, -wait, what? how is this in a hospital db?'),
    ('Sore Throat', 'Caused by many variables such as Allergies, Smoking, Viruses, etc.');



CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors,
    patient_id INTEGER NOT NULL REFERENCES patients,
    visit_date DATE
);

INSERT INTO visits (doctor_id, patient_id, visit_date)
VALUES 
    (1,1,'12-10-2023'), 
    (2,3,'02-16-2024'), 
    (3,2,'04-09-2022');

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    sick_id INTEGER REFERENCES sickness
);

INSERT INTO diagnoses (visit_id, sick_id) 
VALUES
(3, 1),
(2, 2),
(1, 3);


