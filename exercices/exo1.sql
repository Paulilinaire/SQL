/* EXERCICE 1
1. Créer une table personne avec les caractéristiques suivantes
• personne_id clé primaire
• titre M ou Mme
• prenom
• nom
• telephone
• email
Chaque personne peut avoir une ou plusieurs adresses.

2. Créer la table adresse avec une clé étrangère et chaque adresse
possède une rue, une ville et un code postal.
*/

CREATE DATABASE IF NOT EXISTS exo_one
	CHARACTER SET = "utf8mb4" 
    COLLATE = "utf8mb4_general_ci";
    
USE exo_one;

SHOW DATABASES;   

-- DROP DATABASE IF EXISTS exo_one;

CREATE TABLE IF NOT EXISTS personne(
personne_id INT NOT NULL AUTO_INCREMENT,
titre VARCHAR(3) NOT NULL,
prenom VARCHAR(50) NOT NULL,
nom VARCHAR(50) NOT NULL,
telephone VARCHAR(15) NOT NULL,
email VARCHAR(150) NOT NULL,
PRIMARY KEY (personne_id)
);


CREATE TABLE IF NOT EXISTS adresse(
adresse_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
personne_id INT NOT NULL,
rue VARCHAR(100) NOT NULL,
ville VARCHAR(50) NOT NULL,
code_postal VARCHAR(10) NOT NULL
);


ALTER TABLE personne 
	ADD COLUMN adresse_id INT NOT NULL;
    
SHOW COLUMNS FROM personne;
SHOW COLUMNS FROM adresse;

ALTER TABLE adresse
	ADD CONSTRAINT fk_personne_id FOREIGN KEY (personne_id) REFERENCES personne(personne_id); 
    -- car on veut que "personne" ait une ou plusieurs adresses
    
INSERT INTO personne(titre, prenom, nom, telephone, email)
VALUES 
('Mr', 'Thomas','Henriet','06567826', 'toto@gmail.com'),
('Mme', 'Pauline','Henriet','06567826', 'popo@gmail.com'),
('Mme', 'Amelie','Thirion','06567826', 'tata@gmail.com');

SELECT * FROM personne;

INSERT INTO adresse (rue, ville, code_postal,personne_id)
VALUES
('17 rue Lilas','Lille', 59000, 1);

-- Question 3
INSERT INTO adresse (rue, ville, code_postal,personne_id)
VALUES
('17 rue Lilas','Lille', 59000, 2);

INSERT INTO adresse (rue, ville, code_postal,personne_id)
VALUES
('17 rue Lilas','Lille', 59000, 3);

INSERT INTO adresse (rue, ville, code_postal,personne_id)
VALUES
('18 rue Hoche','Paris', 75000, 4);

SELECT * FROM adresse;

-- Question 4 & 5
DELETE FROM adresse WHERE personne_id = 3;
DELETE FROM personne WHERE personne_id = 3;
DELETE FROM adresse WHERE personne_id = 4;
DELETE FROM personne WHERE prenom = 'Amelie';

-- Question 6    
UPDATE
	personne
SET 
	telephone = '0642147878'
WHERE
	nom = 'Dupont';
    
INSERT INTO personne(titre, prenom, nom, telephone, email)
VALUES 
('Mr', 'Thomas','Henriet','06567826', 'toto@gmail.com'),
('Mme', 'Pauline','Henriet','06567826', 'popo@gmail.com'),
('Mme', 'Amelie','Thirion','06567826', 'tata@gmail.com');

-- Question 7
SELECT * FROM personne ORDER BY nom DESC;

-- Question 8
SELECT * FROM personne ORDER BY titre; -- ASC => comportement par défaut

-- Question 9
SELECT * FROM personne WHERE email = 'toto@gmail.com';






DROP TABLE IF EXISTS personne;
DROP TABLE IF EXISTS adresse;
