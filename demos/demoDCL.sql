-- Créer un utilisateur
CREATE USER 'toto'@'localhost' IDENTIFIED BY 'test';
CREATE USER 'clem'@'localhost' IDENTIFIED BY '1234';

-- Donner tous les droits
GRANT ALL PRIVILEGES ON *.* TO 'toto'@'localhost';

-- Voir les privilèges
SHOW GRANTS;

-- Donner tous les droits sur une base spécifique
GRANT ALL PRIVILEGES ON demo_entreprise.* TO 'clem'@'localhost'; -- préciser les prévilèges sur une database en totalité (grâce à *)

-- Donner des droits en lecture sur une bdd
GRANT SELECT ON exo_one.adresse to 'clem'@'localhost';

-- DONNER LES droits de créer et supprimer des personnes
GRANT INSERT, DELETE ON exo_one.personne TO 'clem'@'localhost';

-- Donne l'accès à la colonne nom et prenom de personne
GRANT SELECT (nom, prenom) ON exo_one.personne TO 'clem'@'localhost';

-- Recharger la table des droits
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'clem'@'localhost';
