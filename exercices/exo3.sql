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

-- Question 1 
CREATE TABLE professeur (
professeur_id INT NOT NULL,
prenom VARCHAR(50),
nom VARCHAR(50),
numero_classe INT,
numero_departement INT,
email VARCHAR(250),
telephone VARCHAR(10)
);

-- Question 2 
CREATE TABLE etudiant (
etudiant_id INT NOT NULL,
prenom VARCHAR(50),
nom VARCHAR(50),
numero_classe INT,
telephone VARCHAR(10),
date_diplome DATE
);

-- Question 3
CREATE TABLE professeur_etudiant (
prof_etudiant_id INT NOT NULL AUTO_INCREMENT,
professeur_id INT NOT NULL,
etudiant_id INT NOT NULL,
PRIMARY KEY(prof_etudiant_id),
FOREIGN KEY (professeur_id) REFERENCES professeur(professeur_id),
FOREIGN KEY (etudiant_id) REFERENCES etudiant(etudiant_id)
);

-- Question 4
ALTER TABLE etudiant
MODIFY telephone VARCHAR(10) NOT NULL;

ALTER TABLE etudiant
MODIFY etudiant_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE professeur
MODIFY professeur_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE professeur
ADD CONSTRAINT UC_telephone UNIQUE (telephone);

ALTER TABLE professeur
ADD CONSTRAINT UC_email UNIQUE (email);

ALTER TABLE etudiant
ADD CONSTRAINT UC_telephone UNIQUE (telephone);

-- Question 5
-- INSERT INTO etudiant
INSERT INTO etudiant (prenom, nom, telephone)
VALUES 
('Clemence','Petit','0127456789'),
('Olivia','Pigani','0123456489'),
('Tam','Lam','0123856789');

-- INSERT INTO professeur
INSERT INTO professeur (prenom, nom, numero_classe)
VALUES
('Pierre','Lumière', 125), 
('Yves','Dreux', 120); 

-- INSERT INTO professeur_etudiant
INSERT INTO professeur_etudiant (etudiant_id, professeur_id)
VALUES (2, 1);

INSERT INTO professeur_etudiant (etudiant_id, professeur_id)
VALUES (5, 2);

SELECT * FROM etudiant;
SELECT * FROM professeur;
SELECT * FROM professeur_etudiant;

SHOW COLUMNS FROM professeur_etudiant;
SHOW COLUMNS FROM professeur;
SHOW COLUMNS FROM etudiant;

DROP TABLE professeur;
DROP TABLE etudiant;


    