-- INSERT INTO 

USE demo_entreprise;

-- Méthode 1
-- Sans préciser les colonnes
INSERT INTO service
VALUES (NULL, 'RH', '2023-12-12');

-- Méthode 2
-- En pécisant les colonnes
INSERT INTO service (libelle, date_modification)
VALUES
('compta','2023-12-11'),
('tech','2023-12-10');

SELECT * FROM service;

-- Méthode 3
-- via requête imbriquée
INSERT INTO service (libelle,date_modification)
SELECT
'R&D' as libelle,
'2023-12-09' as date_modification;

SELECT * FROM service;


-- DELETE FROM

-- Supprimer tous les enregistrements
DELETE FROM service;

-- Suppression avec condition sur l'id
DELETE FROM service WHERE service_id = 6;

-- Suppression avec condition sur le libellé
DELETE FROM service WHERE libelle = 'tech';



-- UPDATE FROM

-- Mettre à jour les enregistrements
UPDATE
	service 
SET 
	libelle = 'technologie',
	date_modification = NOW() 
WHERE
	service_id = 2;


-- SELECT 

-- Sélectionner toutes les colonnes d'une table
SELECT * FROM service;
SELECT * FROM salarie;

-- Selectionner une colonne d'une table
SELECT libelle FROM service;

-- Selectionner plusieurs colonnes d'une table
SELECT service_id, libelle FROM service;

-- Prefixer les colonnes du nom de la table
SELECT service.service_id, service.libelle FROM service;

INSERT INTO salarie (prenom, nom, age, salaire, service_id)
VALUES 
('Clémence', 'petit', 30, 15000, 2),
('Olivia', 'Pigani', 64, 20000, 1),
('Tam', 'Lam', 25, 350000, 2),
('Pauline', 'Laout', 22, 100000, 1),
('jeanne', 'dupond', 35, 15000, 2);

INSERT INTO salarie (prenom, nom, age,salaire,service_id)
VALUES
('jeanne','dupond',35,1500,1),
('jacques','chirac',62,3500,2),
('michelle','obama',54,1200,3),
('roberta','patinsona',31,5000,4),
('michael','patate',36,2500,1),
('robert','patinson',32,5000,1),
('robert','patinson',32,5000,2);

SELECT * FROM salarie;

-- Selection sur plusieurs tables
SELECT * FROM service,salarie;

-- instruction where
SELECT nom,prenom FROM salarie WHERE salaire > 1500;

SELECT prenom, nom FROM salarie WHERE salaire < 3000 AND age > 33;
SELECT prenom, nom FROM salarie WHERE salaire > 3600 OR age < 33;

SELECT salarie_id, nom, prenom FROM salarie WHERE age BETWEEN 33 AND 35;

-- DISTINCT : élimine les doublons
SELECT DISTINCT salaire FROM salarie;

-- LIMIT : specidie le nombre de ligne à retourner
SELECT * FROM service LIMIT 2;

-- ORDER BY : retourne le résultat dans un ordre défini
SELECT * FROM service ORDER BY libelle;


-- Requêtes imbriquées (non correlées)
SELECT nom, prenom 
FROM (SELECT * FROM salarie WHERE prenom LIKE 'r%') AS prenom_en_r -- ALIAS NECESSAIRE -- LIKE 'r%' = commencant par 'r'
WHERE age > 25;

SELECT service_id, COUNT(service_id) AS nombre_salarie FROM salarie GROUP BY service_id; -- COUNT => fonction d'agrégation (NOW(),AVG(),...)

SELECT * FROM salarie WHERE nom = 'chirac';

SELECT * FROM salarie WHERE salarie_id = 10; -- recherche par colonne indexée plus efficace

SELECT service_id, AVG(salaire) FROM salarie GROUP BY service_id HAVING AVG(salaire) > 3000; -- GROUP BY et HAVING vont de paire


-- Requêtes corrélées (au contraire des requêtes imbriquées non correlées, la requête interne utilise des valeurs de la requête englobante donc la requête interne dépend de la requête externe)




















