
-- @database elvdatabase.db


SELECT owner, COUNT(*), SPECIES AS num_birds
FROM pet
WHERE UPPER(species) = 'BIRD'
GROUP BY owner;









