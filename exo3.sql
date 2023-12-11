/* EXERCICE 3
1. Créer une table professeur qui possède les colonnes suivantes
	• professeur(id, prénom, nom, n classe, n de département, email, téléphone)
2. Créer une table étudiant avec les attributs suivants
	• etudiant ( prenom nom, téléphone, n classe, date d’obtention du diplôme)
3. Créer une table qui permet d’associer les étudiants à des professeurs composée d’identifiant d’élèves et d’identifiants de professeurs
4. Ajoutez les contraintes suivantes
	• Avoir au minimum 1 numéro de téléphone pour chaque étudiant
	• Avoir des clés primaires pour chaque table
	• Le numéro de téléphone et l’email doivent être unique
5. Tester le fonctionnement des contraintes en insérant des données
*/

CREATE DATABASE IF NOT EXISTS exo_three
	CHARACTER SET = "utf8mb4" 
    COLLATE = "utf8mb4_general_ci";
    
USE exo_three;

SHOW DATABASES;   

-- DROP DATABASE IF EXISTS exo_three;

CREATE TABLE IF NOT EXISTS professeur(
professeur_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
prenom VARCHAR(50) NOT NULL,
nom VARCHAR(50) NOT NULL,
num_classe VARCHAR(10) NOT NULL,
num_departement VARCHAR(10) NOT NULL,
telephone VARCHAR(15) NOT NULL,
email VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS etudiant(
etudiant_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
prenom VARCHAR(50) NOT NULL,
nom VARCHAR(50) NOT NULL,
num_classe VARCHAR(10) NOT NULL,
telephone VARCHAR(15) NOT NULL,
date_diplome DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS Liste_classe(
etudiant_id INT NOT NULL,
CONSTRAINT fk_etudiant_id FOREIGN KEY (etudiant_id) REFERENCES etudiant(etudiant_id),
professeur_id INT NOT NULL,
CONSTRAINT fk_professeur_id FOREIGN KEY (professeur_id) REFERENCES professeur(professeur_id)
);

ALTER TABLE etudiant 
	ADD CONSTRAINT telephone_unique UNIQUE (telephone);
    
SHOW COLUMNS FROM etudiant;

ALTER TABLE Liste_classe 
	ADD COLUMN liste_classe_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
    
ALTER TABLE Liste_classe
	RENAME liste_id;
    
SHOW COLUMNS FROM liste_id;
    
ALTER TABLE professeur 
	ADD CONSTRAINT telephone_unique UNIQUE (telephone);
    
SHOW COLUMNS FROM professeur;
    