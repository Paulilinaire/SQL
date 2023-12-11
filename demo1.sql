-- Commentaire
/********************************
Manipulation des bases de données
********************************/

-- Création de base de données
CREATE DATABASE IF NOT EXISTS demo_entreprise 
	CHARACTER SET = "utf8mb4" 
    COLLATE = "utf8mb4_general_ci";
    
    
-- Permet d'afficher toutes les bases de données;
SHOW DATABASES;    

-- Suppression de la base de données si celle-ci existe
DROP DATABASE IF EXISTS demo_entreprise;

-- Modification de base de données
ALTER DATABASE demo_entreprise CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
ALTER DATABASE demo_entreprise DEFAULT CHARACTER SET utf8mb4;
ALTER DATABASE demo_entreprise ENCRYPTION='Y'; -- ENCRYPTION = YES

-- Afficher les schémas
SELECT * FROM information_schema.SCHEMATA;

-- Utiliser la base de données
USE demo_entreprise;

/***********************
Manipulation des tables
***********************/

-- Création d'une table si elle n'existe pas
CREATE TABLE IF NOT EXISTS service(
service_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
libelle VARCHAR(150) NOT NULL
);


-- Création d'une seconde table
CREATE TABLE IF NOT EXISTS salarie(
salarie_id INT NOT NULL AUTO_INCREMENT, -- Clé primaire qui s'auto-incrémente, la virgule sépare les instructions
prenom VARCHAR(50) NOT NULL, -- Obligation de fournir une valeur
nom VARCHAR(50) NOT NULL,
age INT NOT NULL CHECK(age > 18 AND age < 65), -- Contrainte pour vérifier l'âge
salaire FLOAT NOT NULL DEFAULT 1500, -- Valeur par défaut
service_id INT NOT NULL, -- Ajout de la colonne pour la clé étrangère
PRIMARY KEY(salarie_id),
CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES service(service_id)
);









