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

-- DROP TABLE IF EXISTS personne;
-- DROP TABLE IF EXISTS adresse;
