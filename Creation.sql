CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    age_dor VARCHAR(255)
);

CREATE TABLE types (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255)
);

CREATE TABLE auteurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    date_de_naissance TIMESTAMP
);

CREATE TABLE maisonsEdition (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255)
);


CREATE TABLE etages (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    numero INTEGER
);

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    debut_contrat TIMESTAMP,
    id_etage INTEGER REFERENCES etages,
    id_role INTEGER REFERENCES roles
);

CREATE TABLE etageres (
    id SERIAL PRIMARY KEY,
    categorie VARCHAR(255),
    id_etage INTEGER REFERENCES etages
);

CREATE TABLE livres (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    quantite INTEGER NOT NULL,
    parution TIMESTAMP,
    id_genre INTEGER REFERENCES genres,
    id_type INTEGER REFERENCES types,
    id_auteur INTEGER REFERENCES auteurs,
    id_maison_edition INTEGER REFERENCES maisonsEdition,
    id_etagere INTEGER REFERENCES etageres
);

CREATE TABLE lecteurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    civilite VARCHAR(10),
    age INTEGER,
    debut_abonemment TIMESTAMP,
    id_livre_pref INTEGER REFERENCES livres,
    id_conseillé INTEGER REFERENCES employees
);



CREATE TABLE evenements (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL ,
    type VARCHAR(255),
    sujet VARCHAR(255),
    debut TIMESTAMP,
    fin TIMESTAMP
);

CREATE TABLE ordinateurs (
    access_archive BOOLEAN,
    access_internet BOOLEAN,
    id_lecteur INTEGER REFERENCES lecteurs
);

/*
** TABLES DE JOINTURE **
*/

CREATE TABLE emprunt (
    id_lecteur INTEGER REFERENCES lecteurs,
    id_livre INTEGER REFERENCES livres,
    debut TIMESTAMP,
    fin TIMESTAMP
);

CREATE TABLE organise (
    id_evenement INTEGER REFERENCES evenements,
    id_employee INTEGER REFERENCES employees
);

CREATE TABLE present (
    id_evenement INTEGER REFERENCES  evenements,
    id_maisonEdition INTEGER REFERENCES maisonsEdition
);

CREATE TABLE participe (
    id_evenement INTEGER REFERENCES  evenements,
    id_auteur INTEGER REFERENCES  auteurs
);
