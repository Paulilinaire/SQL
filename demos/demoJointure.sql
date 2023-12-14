CREATE DATABASE jointure;

USE jointure;

-- DROP TABLE utilisateur;
DROP TABLE commande;

CREATE TABLE utilisateur(
id INT PRIMARY KEY AUTO_INCREMENT,
prenom VARCHAR(50) NOT NULL,
nom VARCHAR(50),
email VARCHAR(50),
ville VARCHAR(50),
actif INT
);

CREATE TABLE commande(
utilisateur_id INT,
date_achat DATE,
num_facture CHAR(6),
prix_total DOUBLE
);

INSERT INTO utilisateur(prenom, nom, email, ville, actif)
VALUES 
("Amélie","Laout","am.l@exemple.com","Paris", 0),
("Daniel","Laout","dada@exemple.com","Lyon", 1),
("Thomas","Henriet","toto@exemple.com","Lille", 1),
("Pauline","Laout","popo@exemple.com","Marseille", 1);

INSERT INTO commande(utilisateur_id, date_achat, num_facture, prix_total)
VALUES
(1,'2013-01-23','A00103', 203.10),
(1,'2013-01-24','A00102', 200.06),
(2,'2013-01-25','A00101', 101.15),
(2,'2013-01-26','A00100', 47.50),
(4,'2013-01-23','A00107', 89.99),
(5,'2013-01-22','A00110', 29.99);


-- INNER JOIN
SELECT id, prenom, nom, date_achat, num_facture, prix_total
FROM utilisateur
INNER JOIN commande ON utilisateur.id = commande.utilisateur_id; -- ON nomTable.colonne = nomAutreTable.autreColonne => cela nous permet d'avoir des infos des deux tables dans une même liste

-- LEFT JOIN
SELECT * 
FROM utilisateur
LEFT JOIN commande ON utilisateur.id = commande.utilisateur_id;

-- RIGHT JOIN
SELECT * 
FROM utilisateur
RIGHT JOIN commande ON utilisateur.id = commande.utilisateur_id;

SELECT * 
FROM commande
RIGHT JOIN utilisateur ON utilisateur.id = commande.utilisateur_id;

-- Exemple Left join en excluant les null
SELECT *
FROM utilisateur
LEFT JOIN commande ON utilisateur.id = commande.utilisateur_id
WHERE utilisateur_id IS NOT NULL;

-- FULL JOIN (non pris en compte par MySQL)
-- SELECT *
-- FROM utilisateur
-- FULL JOIN commande ON utilisateur.id = commande.utilisateur_id; => CELA NE FONCTIONNE PAS

-- MySQL ne supporte pas le FULL JOIN on doit donc combiner un LEFT JOIN et un RIGHT JOIN
SELECT *
FROM utilisateur
LEFT JOIN commande ON utilisateur.id = commande.utilisateur_id
UNION
SELECT * 
FROM utilisateur
RIGHT JOIN commande ON utilisateur.id = commande.utilisateur_id;
-- Prends toutes les infos, sans ou avec correspondance alors qu'INNER JOIN va afficher les infos seulement avec correspondance











