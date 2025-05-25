-- Active: 1747679393696@@127.0.0.1@5432@conservation_db@public
-- Creating ranger table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- creating species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

-- creating sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes TEXT
);



INSERT INTO rangers ( name, region) VALUES
( 'Alice Green', 'Northern Hills'),
( 'Bob White', 'River Delta'),
( 'Carol King', 'Mountain Range'),
( 'Eva Black', 'Southern Forest'),
( 'Frank Hill', 'Eastwood'),
( 'Grace Lee', 'Highlands'),
( 'Henry Fox', 'Valley Plains'),
( 'Ivy Brown', 'Wetlands'),
( 'Jack Reed', 'Rocky Ridge');



INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
(5, 'Shadow Leopard', 'Panthera pardus orientalis', '1900-01-01', 'Critically Endangered'),
(6, 'Golden Langur', 'Trachypithecus geei', '1950-05-15', 'Endangered'),
(7, 'Indian Pangolin', 'Manis crassicaudata', '1821-08-10', 'Vulnerable'),
(8, 'Great Hornbill', 'Buceros bicornis', '1758-01-01', 'Near Threatened'),
(9, 'Clouded Leopard', 'Neofelis nebulosa', '1821-06-01', 'Vulnerable'),
(10, 'Black-necked Crane', 'Grus nigricollis', '1845-01-01', 'Vulnerable'),
(11, 'Himalayan Monal', 'Lophophorus impejanus', '1831-01-01', 'Least Concern'),
(12, 'Takin', 'Budorcas taxicolor', '1820-01-01', 'Vulnerable'),
(13, 'Giant Ibis', 'Thaumatibis gigantea', '1850-01-01', 'Critically Endangered'),
(14, 'Chinese Pangolin', 'Manis pentadactyla', '1841-01-01', 'Critically Endangered'),
(15, 'Siberian Musk Deer', 'Moschus moschiferus', '1758-01-01', 'Vulnerable');


INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile tiger seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(5, 5, 4, 'Shadow Valley', '2024-05-20 21:00:00', 'Possible rare sighting'),
(6, 6, 5, 'Golden Forest', '2024-05-22 14:30:00', 'Group of three seen'),
(7, 7, 6, 'Rocky Trails', '2024-05-23 11:00:00', 'Solitary animal spotted'),
(8, 8, 7, 'Hornbill Hill', '2024-05-24 15:45:00', 'Nesting behavior noted'),
(9, 9, 8, 'Cloudy Ridge', '2024-05-25 08:20:00', 'Resting near water source'),
(10, 10, 9, 'Crane Valley', '2024-05-26 17:15:00', 'Flock of cranes flying'),
(11, 11, 1, 'Monal Peak', '2024-05-27 07:00:00', 'Male displaying colors'),
(12, 12, 2, 'Takin Pass', '2024-05-28 18:45:00', 'Group moving uphill'),
(13, 13, 3, 'Ibis Marsh', '2024-05-29 06:50:00', 'Two adults and a chick spotted'),
(14, 14, 4, 'Pangolin Trail', '2024-05-30 22:10:00', 'Tracks found nearby'),
(15, 15, 5, 'Musk Valley', '2024-05-31 05:30:00', 'Musk deer heard at dawn');



-- Problem 1 --> Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- Problem 2 --> Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_sighted
FROM sightings;

-- Problem 3 --> Find all sightings where the location includes "Pass".
SELECT *
FROM sightings
WHERE location LIKE '%Pass%';

-- Problem 4 --> List each ranger's name and their total number of sightings.
SELECT rangers.name AS ranger_name, count(*) AS total_sightings
FROM rangers 
LEFT JOIN sightings ON rangers.ranger_id = sightings.sighting_id
GROUP BY rangers.name
ORDER BY total_sightings DESC;

-- Problem 5 --> List species that have never been sighted.
SELECT species.common_name, species.scientific_name 
FROM species 
LEFT JOIN sightings ON sightings.sighting_id = species.species_id
WHERE species.species_id IS NULL;

-- Problem 6 --> Show the most recent 2 sightings.
SELECT * FROM sightings
ORDER BY sighting_time DESC
LIMIT 2;

-- Problem 7 --> Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET conservation_status = 'Historic'
WHERE CAST(discovery_date AS DATE) < '1800-01-01';

--  Problem 8 -->  Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT * ,
CASE 
    WHEN extract(HOUR FROM sightings.sighting_time) < 12 THEN 'Morning' 
    WHEN extract(HOUR FROM sightings.sighting_time) BETWEEN 12 AND 16 THEN 'Afternoon' 
    ELSE  'Evening'
END AS time_of_day
FROM sightings;

-- Problem 9 -->  Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE NOT EXISTS(
SELECT 1
FROM sightings
WHERE sightings.sighting_id = rangers.ranger_id
);



SELECT * FROM sightings

