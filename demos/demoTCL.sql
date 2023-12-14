CREATE DATABASE transaction;

USE transaction;

-- DROP TABLE users;
-- DROP TABLE orders;

CREATE TABLE users(
id INT AUTO_INCREMENT PRIMARY KEY,
surname VARCHAR(50),
firstname VARCHAR(50),
age INT
);

CREATE TABLE orders(
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
product VARCHAR(50),
quantity INT,
FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (surname, firstname, age)
VALUES
('Doe', 'John', FLOOR(RAND() * 50) + 18), -- FLOOR arrondi au plus petit, +18 pour donner un minimum d'âge à 18ans, ce qui donne un age max à 67 
('Smith', 'Jane', FLOOR(RAND() * 50) + 18),
('Brown', 'David', FLOOR(RAND() * 50) + 18); 

SELECT * FROM users;

INSERT INTO orders (user_id, product, quantity)
VALUES
(1, 'TV', FLOOR(RAND() * 5) + 1), -- quantité max 5, '+1' pour mettre quantité min à 1
(2, 'mascara', FLOOR(RAND() * 5) + 1),
(3, 'Iphone', FLOOR(RAND() * 5) + 1);

SELECT * FROM orders;

-- Début de la transaction
-- BEGIN
START TRANSACTION;

-- Insérer un nouvel utilisateur
INSERT INTO users (surname, firstname, age)
VALUES
('All', 'Good', FLOOR(RAND() * 50) + 18);

-- Recup du dernier id utilisateur inséré
SET @user_id = LAST_INSERT_ID(); -- SET @azerty = déclarer une variable

INSERT INTO orders (user_id, product, quantity)
VALUES
(@user_id, 'TV', FLOOR(RAND() * 5) + 1);

-- Valider ma transaction
COMMIT;
-- important de "commit" avant d'en recommencer une. 
-- Tant que le commit n'est pas fait, aucune requête dans la transaction est enregistrée, sans COMMIT il ne sera pas possible de commencer une nvelle transaction



-- Nouvelle transaction
BEGIN;

-- Insérer un nouvel utilisateur
INSERT INTO users (surname, firstname, age)
VALUES
('NotAll', 'Good', FLOOR(RAND() * 50) + 18);

-- Recup du dernier id utilisateur inséré
SET @user_id = LAST_INSERT_ID(); -- SET @azerty = déclarer une variable

INSERT INTO orders (user_id, product, quantity)
VALUES
(@user_id, 'Iphone', FLOOR(RAND() * 5) + 1);

-- Annuler ma transaction
ROLLBACK; -- tout ce que j'ai fait dans la transaction a été annulée











