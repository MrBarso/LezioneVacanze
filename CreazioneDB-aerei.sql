/* creazione di un database che gestisce compagnie aeree, piloti e voli */

CREATE DATABASE `aerei`;

CREATE TABLE `compagnie` (
  `nome` VARCHAR(20) NOT NULL PRIMARY KEY ,
  `anno_fondazione` YEAR NOT NULL
);

CREATE TABLE 'piloti'(
    'codice' INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    'nome' VARCHAR(20) NOT NULL,
    'cognome' VARCHAR(20) NOT NULL,
    'eta' INT NOT NULL
);

CREATE TABLE 'voli'(
    'numero' VARCHAR(5) NOT NULL PRIMARY KEY,
    'compagnia' VARCHAR(20) NOT NULL,
    'pilota' INT NOT NULL,
    'copilota' INT NOT NULL,
    'orario_partenza' DATETIME NOT NULL,
    'orario_arrivo' DATETIME NOT NULL,
    'durata' FLOAT NOT NULL,
    'destinazione' VARCHAR(20) NOT NULL,
    'scalo' VARCHAR(20) NOT NULL,
    'soppresso' BOOLEAN NOT NULL,
    
    FOREIGN KEY (compagnia) REFERENCES compagnie(nome),
    FOREIGN KEY (pilota) REFERENCES piloti(codice),
    FOREIGN KEY (copilota) REFERENCES piloti(codice)
);