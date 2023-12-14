USE exo_one;

SELECT * FROM adresse;

DELETE FROM adresse WHERE adresse_id = 2; -- pas possible car n'a pas les droits

SELECT * FROM personne; -- pas possible non plus. Donc peut ajouter des nouvelles personnes mais peut pas voir la table personne

SELECT nom, prenom FROM personne; -- maintenant possible car privileges donnés