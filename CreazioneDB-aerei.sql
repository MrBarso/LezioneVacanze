-- creazione database
CREATE DATABASE aerei;

--creazione tabella compagnie
CREATE TABLE compagnie(
    'nome' VARCHAR(16) NOT NULL,
    'anno_fondazione' YEAR NOT NULL,

    PRIMARY KEY ('nome')
);

--creazione tabella piloti
CREATE TABLE piloti(
    'codice' INT NOT NULL AUTO_INCREMENT, 
    'nome' VARCHAR(16) NOT NULL, 
 
    PRIMARY KEY ('codice')
);

--creazione tabella clienti
CREATE TABLE voli (
    'numero' VARCHAR(5) NOT NULL,
    'compagnia' VARCHAR(20) NOT NULL,
    'orario_partenza' HOUR NOT NULL,
    'orario_arrivo' HOUR NOT NULL,
    'durata' FLOAT NOT NULL
    'partenza' VARCHAR(20) NOT NULL,
    'destinazione' VARCHAR(20) NOT NULL,
    'scalo' VARCHAR(20),
    'soppresso' BOOLEAN NOT NULL,
    'pilota' INT NOT NULL,
    'copilota' INT NOT NULL,


    PRIMARY KEY ('numero'),
    FOREIGN KEY (compagnia) REFERENCES compagnie.nome
    FOREIGN KEY (pilota) REFERENCES piloti.codice
    FOREIGN KEY (copilota) REFERENCES piloti.codice
);