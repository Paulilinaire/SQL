-- Exercice 5

USE bdd_villes_departements;

SELECT * FROM villes_france_free;

-- QUESTION 1 : Obtenir la liste des 10 villes les plus peuplées en 2012
SELECT ville_departement, ville_nom_reel, ville_population_2012 FROM villes_france_free ORDER BY ville_population_2012 DESC LIMIT 10;

-- QUESTION 2 : Obtenir la liste des 50 villes ayant la plus faible superficie
SELECT ville_departement, ville_nom_reel, ville_surface FROM villes_france_free ORDER BY ville_surface LIMIT 50;

-- QUESTION 3 : Obtenir la liste des départementsd’outre-mer, c’est-à-dire ceux dont le numérode département commençant par “97”
SELECT * FROM departement WHERE departement_code LIKE '97%';

-- QUESTION 4 : Obtenir le nom des 10 villes les plus peupléesen 2012, ainsi que le nom du département associé
SELECT ville_departement, ville_nom_reel, departement_nom, ville_population_2012
FROM villes_france_free 
INNER JOIN departement ON ville_departement = departement_code 
ORDER BY ville_population_2012 DESC LIMIT 10;

-- QUESTION 5 : Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces départements, 
-- en triant afin d’obtenir en priorité les départements qui possèdentle plus de communes
SELECT departement_nom, ville_departement, COUNT(ville_id) AS nombre_communes
FROM departement
INNER JOIN villes_france_free ON departement_code = ville_departement 
GROUP BY departement_nom, departement_code 
ORDER BY nombre_communes DESC;

-- QUESTION 6 : Obtenir la liste des 10 plus grands départements, en termes de superficie
SELECT departement_nom, ville departement, SUM(ville_surface) AS biggest_departement
FROM departement
INNER JOIN villes_france_free ON departement_code = ville_departement 
GROUP BY departement_nom, ville_departement
ORDER BY biggest_departement DESC LIMIT 10;

-- QUESTION 7 : Compter le nombre de villes dont le nom commence par “Saint”
SELECT COUNT(ville_id) FROM villes_france_free WHERE ville_nom LIKE 'Saint%';

-- QUESTION 8 : Obtenir la liste des villes qui ont un nom existants plusieurs fois, 
-- et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
SELECT ville_nom, COUNT(*) AS nombre_occurrences
FROM villes_france_free
GROUP BY ville_nom
HAVING COUNT(*) > 1
ORDER BY nombre_occurrences DESC;
  
-- QUESTION 9 : Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieure à la superficie moyenne
SELECT ville_nom, ville_surface
FROM villes_france_free
WHERE ville_surface > (SELECT AVG(ville_surface) FROM villes_france_free)
ORDER BY ville_surface; 

-- QUESTION 10 : Obtenir la liste des départementsqui possèdentplus de 2 millions d’habitants
SELECT ville_departement, departement_nom, SUM(ville_population_2012) AS population_2012
FROM villes_france_free
INNER JOIN departement ON ville_departement = departement_code 
GROUP BY ville_departement, departement_nom
HAVING population_2012 > 2000000;

-- QUESTION 11 : Remplacez les tirets par un espace vide, pour toutes les villes commençantpar “SAINT-” (dans la colonne qui contient les noms en majuscule)

SELECT COUNT(*) FROM villes_france_free WHERE ville_nom LIKE 'Saint-%';

UPDATE villes_france_free
SET ville_nom = REPLACE(ville_nom, '-', ' ')
WHERE ville_nom LIKE 'SAINT-%';






