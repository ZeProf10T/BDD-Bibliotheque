INSERT INTO genres (nom, age_dor)
VALUES ('Humoristique', 'actuel'),
       ('Science', NULL),
       ('Informatique', 'contemporain'),
       ('Policier', NULL),
       ('Thriller', 'contemporain'),
       ('Poésie', '19-20éme siécle'),
       ('Autre', NULL);

INSERT INTO types (nom)
VALUES ('Roman'),
       ('Bande Dessinée'),
       ('Documentaire'),
       ('Biographie'),
       ('Recueil'),
       ('Ressource universitaire'),
       ('Roman graphique');

INSERT INTO auteurs (nom, prenom, date_de_naissance)
VALUES ('Rimbaud','Arthur','20-10-1854'),
       ('Cauvin','Raoul','26-09-1938'),
       ('Camus','Albert','7-11-1913'),
       ('Christie','Agatha', '15-09-1890'),
       ('Pagnol', 'Marcel','28-02-1895'),
       ('Blandy', 'Jim', NULL),
       ('Lutz', 'Mark', NULL),
       ('King', 'Stephen', '21-09-1947'),
       ('Dupas', 'Alain', '11-11-1945'),
       ('Pellicier', 'Raynal', NULL),
       ('Turing', 'Alan', '23-06-1912');

INSERT INTO maisonsedition (nom)
VALUES ('Nathan'),
       ('Dupuis'),
       ('Folio'),
       ('Livre de Poche'),
       ('Le masque'),
       ('De falois'),
       ('O''Reilly'),
       ('Alibin Michel'),
       ('Odile Jacob'),
       ('Edition De La Martinière'),
       ('Points');

INSERT INTO etages (type,numero)
VALUES ('Archive', -2),
       ('Archive', -1),
       ('Libre-Service', 0),
       ('Libre-service', 1),
       ('Libre-service', 2),
       ('Libre-service', 3);

INSERT INTO etageres (categorie, id_etage)
VALUES ('Science',6),
       ('Science',1),
       ('Roman',5),
       ('Roman',5),
       ('Roman',2),
       ('Bande Dessiné',3),
       ('Documentaire', 6),
       ('Biographie',6),
       ('Recueil', 5),
       ('Bande Dessiné / Roman Graphique',3),
       ('Roman Graphique',5);

INSERT INTO livres (titre, quantite, parution, id_genre, id_type, id_auteur, id_maison_edition, id_etagere)
VALUES ('Les cahiers de Douai',5, '04-05-2018', 6, 5, 1, 1, 9),
       ('Les tuniques bleues - Tome 30 : La Rose de Bantry', 3, '08-01-2020', 1, 2, 2, 2, 6),
       ('Les tuniques bleues - Tome 63 : La bataille du cratère', 1, '25-09-2019', 1, 2, 2, 2, 10),
       ('L''étranger', 5, '01-01-1972', 7, 1, 3, 3, 4),
       ('Dix petit négres', 2, '01-08-2014', 4, 1, 4, 4, 5),
       ('Le crime de l''Orient-Express', 2, '01-08-2014', 4, 1, 4, 4, 5),
       ('Mort sur le nil', 1, '29-02-2012', 4, 1, 4, 5, 3),
       ('La gloire de mon père', 3, '01-09-2004', 7, 1, 5, 6, 4),
       ('Programming Rust : Fast, Safe Systems Development', 1, '01-12-2017', 3, 6, 6, 7, 1),
       ('Learning Python : Powerful Object-Oriented Programming', 1, '01-06-2013', 3, 6, 7, 7, 1),
       ('L''Institut ', 3, '29-01-2020', 5, 1, 8, 8, 4),
       ('Innover comme Elon Musk, Jeff Bezos et Steve Jobs ', 2, '20-02-2019', 2, 4, 9, 9, 8),
       ('Brigade des mineurs', 3, '23-03-2017', 4, 7, 10, 10, 10),
       ('Enquêtes générales. Immersion au coeur de la brigade de répression du banditisme', 3, '03-10-2013', 4, 7, 10, 10, 11),
       ('La Machine de Turing', 5, '01-03-1999', 3, 6, 11, 11, 1);


INSERT INTO roles (nom)
VALUES ('Archiviste'),
       ('Conseillé'),
       ('Organisateur d''évenement');

INSERT INTO employees (nom, prenom, debut_contrat, id_etage, id_role)
VALUES ('Dupont', 'Jean-Eude', '15-08-2017', 1, 1),
       ('Marianne', 'Mireille', '03-09-2014', 2, 1),
       ('Balasco', 'José', '24-01-2012', 3, 3),
       ('Duplessi', 'Pascal', '19-03-2007', 6, 2),
       ('Prince', 'Jean-Paul', '04-01-2013', 5, 2),
       ('Brunet', 'Marie', '03-07-2015', 4, 2),
       ('Cotillard', 'Marine', '12-04-2013', 3, 2),
       ('Dujardin', 'Julien', '09-12-2019', 4, 2),
       ('John', 'Pierre-Yves', '04-01-2020', 6, 2),
       ('Trumpétiste', 'Mélania', '07-03-2019', 5, 3),
       ('Cranberies', 'Sara', '17-04-2018', 6, 3),
       ('Bertrand', 'Jean', '07-08-2017', 5, 3);


INSERT INTO lecteurs (nom, prenom, civilite, age, debut_abonemment, id_livre_pref, id_conseillé)
VALUES ('Huteau', 'Léo', 'Mr', 18, '01-09-2005', 2, 4),
       ('Prince', 'Tanguy', 'Mr', 18, '15-03-2017', 4, 6),
       ('Khamlichi', 'Jamal', 'Mr', 60, '10-05-1990', 10, 9),
       ('Cerveau', 'Constance','Mme', 18, '07-11-2007', 5, 5),
       ('Debouchage', 'Arnaud', 'Mr', 18, '03-01-2019', 12, 7),
       ('Helly', 'Bernard', 'Mr', 42, '15-12-1998', 15, 4),
       ('Peraudeau', 'Maxime', 'Mr', 18, '27-04-2014', 1, 6),
       ('Autessier', 'Arthur', 'Mr', 19, '18-06-2017', 6, 5),
       ('Gérard', 'Jean-Luc', 'Mr', 47, '14-08-2003', 3, 4),
       ('Aubry', 'Marine', 'Mme', 36, '04-07-2017', 2, 9);


INSERT INTO emprunt (id_lecteur, id_livre, debut, fin)
VALUES (1, 2, '10-01-2018', '10-02-2018'),
       (5, 3, '12-12-2019', '12-01-2020'),
       (7, 3, '25-03-2012', '04-04-2012'),
       (4, 7, '17-05-2018', '24-09-2018'),
       (1, 7, '12-05-2017', '13-12-2018'),
       (3, 1, '10-01-2018', '10-02-2018'),
       (4, 2, '12-12-2019', '12-01-2020'),
       (1, 3, '25-04-2012', '04-05-2012'),
       (2, 7, '17-05-2018', '24-07-2018'),
       (4, 7, '12-05-2017', '13-08-2018'),
       (1, 14, '10-01-2018', '10-02-2018'),
       (5, 14, '12-12-2019', '12-01-2020'),
       (7, 15, '25-03-2012', '04-04-2012'),
       (4, 13, '17-05-2018', '24-09-2018'),
       (1, 13, '12-05-2017', '13-12-2018'),
       (8, 12, '10-01-2018', '10-02-2018'),
       (5, 8, '12-12-2019', '12-01-2020'),
       (7, 13, '25-04-2012', '04-05-2012'),
       (3, 10, '17-05-2018', '24-07-2018'),
       (8, 15, '12-05-2017', '13-08-2018'),
       (1, 10, '10-01-2018', '10-02-2018'),
       (5, 13, '12-12-2019', '12-01-2020'),
       (7, 2, '25-03-2014', '04-04-2015'),
       (5, 4, '17-05-2018', '24-09-2018'),
       (5, 7, '12-05-2017', '13-12-2018'),
       (5, 7, '10-01-2018', '10-02-2019'),
       (5, 1, '11-12-2019', '12-01-2020'),
       (7, 5, '24-04-2012', '04-06-2013'),
       (1, 5, '12-05-2018', '24-06-2018'),
       (2, 11, '12-05-2017', '13-09-2018'),
       (3, 6, '10-01-2018', '10-08-2018'),
       (4, 4, '07-12-2019', '12-08-2020'),
       (5, 9, '05-03-2012', '04-07-2012'),
       (6, 8, '17-05-2018', '24-10-2018'),
       (3, 11, '24-05-2017', '13-01-2019'),
       (8, 10, '04-01-2018', '10-04-2018'),
       (7, 8, '12-12-2019', '12-02-2020'),
       (9, 2, '23-05-2017', '25-09-2018'),
       (2, 13, '07-04-2012', '04-06-2012'),
       (2, 4, '08-05-2018', '24-08-2018'),
       (6, 13, '04-09-2019', '07-10-2019');


INSERT INTO ordinateurs (access_archive, access_internet, id_lecteur)
VALUES (True, True, 3),
       (True, False, 7),
       (False, True, 1),
       (False, True, NULL),
       (True, False, NULL),
       (True, True, 7);

INSERT INTO evenements (nom, type, sujet, debut, fin)
VALUES ('48H de la BD', 'Dédicace', 'Bande déssinée', '03-04-2020', '04-04-2020'),
       ('Journée du livre', 'Salon', 'Livre', '23-04-2020', '23-04-2020'),
       ('Fete de l''été', 'Salon', 'Livre', '14-08-2020', '17-08-2020'),
       ('Téléthon : défi lecture', 'Caritatif', 'Roman', '4-12-2020', '6-12-2020'),
       ('La journée du Roman Graphique et de la Bande Déssinée', 'Dédicace', 'Roman Graphique et Bande déssiné', '08-04-2020', '12-04-2020'),
       ('Les Romans de 2020', 'Débat', 'Roman', '10-01-2020', '10-01-2020'),
       ('Fete de la musique', 'Débat', 'La musique dans les livres', '21-06-2020', '21-06-2020'),
       ('Coding''UP', 'Concours', 'Concours de programmation', '22-03-2020', '22-03-2020');

/* Association entre un auteur et un événement */
INSERT INTO participe (id_evenement, id_auteur)
VALUES (1, 2),
       (2, 8),
       (3, 9),
       (4, 9),
       (5, 2),
       (5, 10),
       (8, 6),
       (8, 7),
       (7, 9),
       (4, 8);

/* Association entre un employé et un événement qu'il organise */
INSERT INTO organise (id_evenement, id_employee)
VALUES (1, 10),
       (1, 3),
       (2, 3),
       (2, 11),
       (4, 12),
       (3, 10),
       (4, 3),
       (5, 3),
       (5, 10),
       (6, 10),
       (7, 3);

/* Association entre une Maison d'édition et un événement */
INSERT INTO present (id_evenement, id_maisonedition)
VALUES (1, 2),
       (2, 1),
       (2, 3),
       (2, 4),
       (4, 6),
       (5, 2),
       (5, 10),
       (6, 1),
       (6, 3),
       (6, 4),
       (6, 5),
       (6, 6),
       (6, 11),
       (8, 7);




