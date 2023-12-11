CREATE DATABASE IF NOT EXISTS exo_two
	CHARACTER SET = "utf8mb4" 
    COLLATE = "utf8mb4_general_ci";
    
USE exo_two;

SHOW DATABASES;   

-- DROP DATABASE IF EXISTS exo_two;

-- Question 1
CREATE TABLE IF NOT EXISTS compte(
compte_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pseudo VARCHAR(50) NOT NULL,
mot_de_passe VARCHAR(50) NOT NULL,
email VARCHAR(255) NOT NULL,
date_creation DATETIME,
derniere_connexion VARCHAR(50)
);

-- Question 2
CREATE TABLE IF NOT EXISTS role(
role_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
libelle VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS compte_role(
compte_id INT NOT NULL,
role_id INT NOT NULL,
date_ajout DATETIME DEFAULT NOW(),
PRIMARY KEY (compte_id, role_id),
FOREIGN KEY(compte_id) REFERENCES compte(compte_id),
FOREIGN KEY(role_id) REFERENCES role(role_id)
);

SHOW COLUMNS FROM compte_role;
-- DROP TABLE IF EXISTS compte;
-- DROP TABLE IF EXISTS compte_role;
-- DROP TABLE IF EXISTS role;



