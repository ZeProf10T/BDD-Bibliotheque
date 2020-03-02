/* Supression des tables de jonction */
DROP TABLE IF EXISTS participe, present, organise, emprunt;

/* Supression des classes globales */
DROP TABLE IF EXISTS ordinateurs, evenements, lecteurs, livres, etageres, employees, roles, etages, maisonsedition, auteurs, types, genres CASCADE ;