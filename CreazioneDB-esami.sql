-- creazione database
CREATE DATABASE magistrali;

--creazione tabella docenti
CREATE TABLE `docente` (
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `cognome` VARCHAR(20) NOT NULL,
  `dipartimento` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
);

--creazione tabella corsi (ha i docenti come fk)
CREATE TABLE `corso` (
  `sigla` VARCHAR(10) NOT NULL,
  `nome_corso` VARCHAR(20) NOT NULL,
  'obbligatorio' BOOLEAN NOT NULL,
  `docente` VARCHAR(255) NOT NULL,
  `crediti` ENUM(3, 6, 9, 12, 15) NOT NULL,
  `semestre` ENUM('invernale','autunnale') NOT NULL,
  PRIMARY KEY (`sigla`),
  FOREIGN KEY (`docente`) REFERENCES `docente`(`id`)
);

--creazione tabella studenti (ha i corsi come fk)'
CREATE TABLE `studente` (
  `matricola` VARCHAR(10) NOT NULL,
  `sesso` ENUM('M', 'F') NOT NULL,
  `nome_universita` VARCHAR(20) NOT NULL,
  `corso` VARCHAR(10) NOT NULL,
  `anno_iscrizione` YEAR NOT NULL,
  PRIMARY KEY (`matricola`),
  FOREIGN KEY (`corso`) REFERENCES `corso`(`sigla`)
);

--creazione tabella esami (ha corsi e studenti come fk)'
CREATE TABLE `esame` (
  `id_esame` INT NOT NULL AUTO_INCREMENT,
  `voto` INT CHECK (`voto` BETWEEN 1 AND 31),
  `studente_matricola` VARCHAR(10) NOT NULL,
  `corso_sigla` VARCHAR(10) NOT NULL,
  `sessione` ENUM('invernale', 'estiva', 'autunnale') NOT NULL,
  `anno_accademico` YEAR NOT NULL,
  PRIMARY KEY (`id_esame`),
  FOREIGN KEY (`studente_matricola`) REFERENCES `studente`(`matricola`),
  FOREIGN KEY (`corso_sigla`) REFERENCES `corso`(`sigla`)
);

--  piccolo esempio di come posso cambiare cose per una PULL da un branch mio