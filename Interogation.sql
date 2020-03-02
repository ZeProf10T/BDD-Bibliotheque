/* Livre préféré */
SELECT CONCAT(lecteurs.civilite, ' ', lecteurs.nom, ' ', lecteurs.prenom) AS Lecteur,
       titre AS "livre préféré",
       CONCAT(auteurs.prenom, ' ', auteurs.nom) AS Auteur,
       genres.nom AS Genre,
       types.nom AS Type,
       maisonsedition.nom AS "maison d'édition",
       quantite
FROM livres, genres, types, auteurs, maisonsedition, etageres, lecteurs
WHERE lecteurs.id_livre_pref = livres.id
    AND id_genre = genres.id
    AND id_type = types.id
    AND id_auteur = auteurs.id
    AND id_maison_edition = maisonsedition.id
    AND id_etagere = etageres.id;


/* Emprunts */
SELECT CONCAT(lecteurs.civilite, ' ', lecteurs.nom, ' ', lecteurs.prenom) AS Lecteur,
       titre AS "livre emprunté",
       CONCAT(auteurs.prenom, ' ', auteurs.nom) AS Auteur
FROM livres, auteurs, lecteurs, emprunt
WHERE emprunt.id_livre = livres.id
    AND emprunt.id_lecteur = lecteurs.id
    AND id_auteur = auteurs.id
ORDER BY lecteurs.nom;

/* Evenements */
SELECT evenements.nom AS "Evenement",
       CONCAT(employees.nom, ' ', employees.prenom) AS Organisateur,
       CONCAT(auteurs.nom, ' ', auteurs.prenom) AS Auteur,
       maisonsedition.nom AS "maison d'édition",
       date(evenements.debut) AS "début"
FROM evenements, employees, organise, maisonsedition, present, auteurs, participe
WHERE organise.id_evenement = evenements.id
    AND organise.id_employee = employees.id
    AND present.id_evenement = evenements.id
    AND present.id_maisonedition = maisonsedition.id
    AND participe.id_evenement = evenements.id
    AND participe.id_auteur = auteurs.id
ORDER BY evenements.nom;


/* Quelle est l’âge moyen d’un lecteur du livre 'Brigade des mineurs' ? */
SELECT AVG(lecteurs.age) AS "Age moyen"
FROM emprunt
INNER JOIN lecteurs ON lecteurs.id = emprunt.id_lecteur
INNER JOIN livres ON livres.id = emprunt.id_livre
WHERE livres.titre = 'Brigade des mineurs'
GROUP BY livres.id;

/* Qu’elle est la maison d’édition avec le plus de livres préférés ? */
SELECT maisonsedition.nom AS "Maison d'édition",
       COUNT(livres.id) AS "Nombre de livre préféré"
FROM livres, maisonsedition, lecteurs
WHERE livres.id = lecteurs.id_livre_pref
    AND livres.id_maison_edition = maisonsedition.id
GROUP BY maisonsedition.id
ORDER BY COUNT(livres.id) DESC;

/* Combien d’étagères possèdent des BD’s ? */
SELECT COUNT(types.nom) AS Nombre
FROM etageres, livres, types
WHERE livres.id_type = types.id
    AND livres.id_etagere = etageres.id
    AND types.nom = 'Bande Dessinée'
GROUP BY types.nom;

/* Combien de lecteurs ont pour livre préféreré, une BD de Raoul Cauvin ? */
SELECT COUNT(livres.id_auteur) AS Nombre
FROM livres, lecteurs, auteurs, types
WHERE lecteurs.id_livre_pref = livres.id
    AND livres.id_auteur = auteurs.id
    AND livres.id_type = types.id
    AND types.nom = 'Bande Dessinée'
    AND auteurs.nom = 'Cauvin'
    AND auteurs.prenom = 'Raoul'
GROUP BY livres.id_auteur;

/* Quels sont les employés qui ont organisés un évènement avec l’auteur Raynal Pellicier, quels sont ses évenements et quand commence t'il? */
SELECT evenements.nom AS evenement,
       CONCAT(employees.nom, ' ', employees.prenom) AS employé,
       to_char(evenements.debut, 'Day, the DD Mon. of YYYY') AS debut
FROM evenements, employees, organise, auteurs, participe
WHERE evenements.id = organise.id_evenement
    AND employees.id = organise.id_employee
    AND evenements.id = participe.id_evenement
    AND auteurs.id = participe.id_auteur
    AND auteurs.nom = 'Pellicier'
    AND auteurs.prenom = 'Raynal';

/* Quels livres ont été emprunté par les client ayant pour conseiller Brunet Marie? */
SELECT CONCAT(lecteurs.civilite, ' ', lecteurs.nom, ' ', lecteurs.prenom) AS Lecteur,
       titre AS "Livre conseillé"
FROM livres, lecteurs, emprunt,  employees
WHERE emprunt.id_lecteur = lecteurs.id
    AND emprunt.id_livre = livres.id
    AND lecteurs.id_conseillé = employees.id
    AND employees.nom = 'Brunet'
    AND employees.prenom = 'Marie'
ORDER BY lecteurs.nom;

/* Combien de fois ont étaient empruntée les différentes BDs ayant pour maison d’édition Dupuis et pour auteur Raoul Cauvin ? */
SELECT titre,
       COUNT(livres.id) AS Emprunts
FROM livres, emprunt, lecteurs, types, auteurs
WHERE livres.id = emprunt.id_livre
    AND lecteurs.id = emprunt.id_lecteur
    AND types.id = livres.id_type
    AND types.nom = 'Bande Dessinée'
    AND auteurs.id = livres.id_auteur
    AND auteurs.nom = 'Cauvin'
    AND auteurs.prenom = 'Raoul'
GROUP BY livres.id;

/* Quels auteurs ont participés à plusieurs évenements ? */
SELECT CONCAT(auteurs.prenom, ' ', auteurs.nom) AS Auteur,
       COUNT(auteurs.id) AS "Nombre d'évenement"
FROM auteurs, evenements, participe
WHERE evenements.id = participe.id_evenement
    AND auteurs.id = participe.id_auteur
GROUP BY auteurs.id
HAVING COUNT(auteurs.id) >= 2
ORDER BY "Nombre d'évenement";

/* Quel est le nombre de livre que Léo Huteau à emprunté dans l'étage qu'il utilise le plus ? */
SELECT etages.numero AS Etage,
       COUNT(livres.titre) AS "Nombre de livres"
FROM etages, etageres, livres, lecteurs, emprunt
WHERE livres.id = emprunt.id_livre
    AND lecteurs.id = emprunt.id_lecteur
    AND livres.id_etagere = etageres.id
    AND etageres.id_etage = etages.id
    AND lecteurs.nom = 'Huteau'
    AND lecteurs.prenom = 'Léo'
GROUP BY etages.numero
ORDER BY "Nombre de livres" DESC
LIMIT 1;

/*  Quel est le livre le plus empruntés au 2ème étage ? */
SELECT livres.titre,
       COUNT(livres.id) AS "Nombre d'emprunt"
FROM livres, emprunt, etages, etageres, lecteurs
WHERE livres.id_etagere = etageres.id
    AND etageres.id_etage = etages.id
    AND emprunt.id_livre = livres.id
    AND emprunt.id_lecteur = lecteurs.id
    AND etages.numero = 2
GROUP BY livres.id
ORDER BY "Nombre d'emprunt" DESC
LIMIT 1;

/* Combien d’employés ont organisés des évenements avec l’auteur Stephen King ? */
SELECT COUNT(DISTINCT employees.nom) AS "Employés"
FROM employees, roles, evenements, organise, participe, auteurs
WHERE employees.id_role = roles.id
    AND roles.nom = 'Organisateur d''évenement'
    AND evenements.id = organise.id_evenement
    AND employees.id = organise.id_employee
    AND evenements.id = participe.id_evenement
    AND auteurs.id = participe.id_auteur
    AND auteurs.nom = 'King'
    AND auteurs.prenom = 'Stephen';

