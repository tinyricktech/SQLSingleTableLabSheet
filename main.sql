
-- @database elvdatabase.db
------------------------------------------------------------
-- Lab 1: Single Table Queries
-- Student: Elvis
-- File: main.sql
-- Purpose: All queries for Q1, Q2, Q3
------------------------------------------------------------

------------------------------------------------------------
-- SECTION 0: TABLE CREATION + DATA INSERTION
------------------------------------------------------------

DROP TABLE IF EXISTS pet;

CREATE TABLE pet (
    name VARCHAR(20),
    owner VARCHAR(20),
    species VARCHAR(20),
    sex CHAR(1),
    checkups SMALLINT UNSIGNED,
    birth DATE,
    death DATE
);

INSERT INTO pet (name, owner, species, sex, checkups, birth, death) VALUES
('Fluffy', 'Harold', 'cat', 'f', 5, '2001-02-04', NULL),
('Claws', 'Gwen', 'cat', 'm', 2, '2000-03-17', NULL),
('Buffy', 'Harold', 'dog', 'f', 7, '1999-05-13', NULL),
('Fang', 'Benny', 'dog', 'm', 4, '2000-08-27', NULL),
('Bowser', 'Diane', 'dog', 'm', 8, '1998-08-31', '2001-07-29'),
('Chirpy', 'Gwen', 'bird', 'f', 0, '2002-09-11', NULL),
('Whistler', 'Gwen', 'bird', '', 1, '2001-12-09', NULL),
('Slim', 'Benny', 'snake', 'm', 5, '2001-04-29', NULL);

------------------------------------------------------------
-- SECTION 1: Q1 — Basic SELECT Queries
------------------------------------------------------------

-- Q1-1: Names of owners and their pets who are female
SELECT owner, name
FROM pet
WHERE sex = 'f';

-- Q1-2: Names and birth dates of dogs
SELECT name, birth
FROM pet
WHERE species = 'dog';

-- Q1-3: Names of owners of birds
SELECT DISTINCT owner
FROM pet
WHERE species = 'bird';

-- Q1-4: Species of pets who are female
SELECT DISTINCT species
FROM pet
WHERE sex = 'f';

-- Q1-5: Names and birth dates of cats or birds
SELECT name, birth
FROM pet
WHERE species = 'cat' OR species = 'bird';

-- Q1-6: Names and species of cats or birds that are female
SELECT name, species
FROM pet
WHERE (species = 'cat' OR species = 'bird')
  AND sex = 'f';

------------------------------------------------------------
-- SECTION 2: Q2 — Pattern Matching & Ordering
------------------------------------------------------------

-- Q2-1: Pets whose name ends with "er" or "all"
SELECT name
FROM pet
WHERE name LIKE '%er' OR name LIKE '%all';

-- Q2-2: Pets whose owner's name contains "e"
SELECT name
FROM pet
WHERE owner LIKE '%e%';

-- Q2-3: Pets whose name does NOT end with "fy"
SELECT name
FROM pet
WHERE name NOT LIKE '%fy';

-- Q2-4: Pets whose owner's name is 4 letters long
SELECT name
FROM pet
WHERE LENGTH(owner) = 4;

-- Q2-5: Owners whose names begin AND end with A–E (case-insensitive)
SELECT DISTINCT owner
FROM pet
WHERE UPPER(SUBSTR(owner, 1, 1)) BETWEEN 'A' AND 'E'
  AND UPPER(SUBSTR(owner, LENGTH(owner), 1)) BETWEEN 'A' AND 'E';

-- Q2-6: Same as above but case-sensitive
SELECT DISTINCT owner
FROM pet
WHERE SUBSTR(owner, 1, 1) BETWEEN 'A' AND 'E'
  AND SUBSTR(owner, LENGTH(owner), 1) BETWEEN 'A' AND 'E';

------------------------------------------------------------
-- SECTION 3: Q3 — Grouping & Aggregates
------------------------------------------------------------

-- Q3-1: Average number of checkups per owner
SELECT owner, AVG(checkups) AS avg_checkups
FROM pet
GROUP BY owner;

-- Q3-2: Number of pets per species (ascending)
SELECT species, COUNT(*) AS num_pets
FROM pet
GROUP BY species
ORDER BY num_pets ASC;

-- Q3-3: Number of pets per species per owner
SELECT owner, species, COUNT(*) AS num_pets
FROM pet
GROUP BY owner, species;

-- Q3-4: Number of distinct species per owner
SELECT owner, COUNT(DISTINCT species) AS distinct_species
FROM pet
GROUP BY owner;

-- Q3-5: Number of pets per gender (gender known)
SELECT sex, COUNT(*) AS num_pets
FROM pet
WHERE sex IS NOT NULL AND sex <> ''
GROUP BY sex;

-- Q3-6: Number of birds per owner
SELECT owner, COUNT(*) AS num_birds
FROM pet
WHERE LOWER(species) = 'bird'
GROUP BY owner;

-- Q3-7: Total checkups per owner
SELECT owner, SUM(checkups) AS total_checkups
FROM pet
GROUP BY owner;











