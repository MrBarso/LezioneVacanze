-- creazione database
CREATE DATABASE carte;

--creazione tabella clienti
CREATE TABLE clienti (
    'cf' VARCHAR(16) NOT NULL,
    'nome' VARCHAR(20) NOT NULL,
    'fascia_reddito' FLOAT NOT NULL,
    'sesso' ENUM('M', 'F') NOT NULL,
    'data_nascita' DATE NOT NULL,
    'indirizzo' VARCHAR(30) NOT NULL,
    'saldo' FLOAT NOT NULL,
    'numero_carta'  VARCHAR(12) NOT NULL,
    'scadenza_carta' DATE NOT NULL,

    PRIMARY KEY ('cf')
);


--creazione tabella promozioni
CREATE TABLE promozioni(
    'codice' VARCHAR(16) NOT NULL,
    'nome_prodotto' VARCHAR(20) NOT NULL,
    'costo_prodotto' FLOAT NOT NULL,
    'data_inizio' DATE NOT NULL,
    'data_fine' DATE NOT NULL,

    PRIMARY KEY ('codice')
);

--creazione tabella offerta (entità relazionale tra promozioni e clienti, ha come FK le PK di clienti e promozioni)
CREATE TABLE offerte(
    'cf' VARCHAR(16) NOT NULL, 
    'codice' VARCHAR(16) NOT NULL, 
    'risposta' ENUM('si', 'no') NOT NULL, 

    FOREIGN KEY (cf) REFERENCES clienti.cf, 
    FOREIGN KEY (codice) REFERENCES promozioni.codice, 
    PRIMARY KEY (cf, codice)
);


--creazione tabella estratti conto (ha come FK la PK dei clienti)
CREATE TABLE estratti_conto(
    'numero' INT NOT NULL AUTO_INCREMENT,
    'data' DATE NOT NULL,
    'totale_spesa' FLOAT NOT NULL,
    'cf' VARCHAR(16) NOT NULL,

    PRIMARY KEY ('numero'),
    FOREIGN KEY ('cf') REFERENCES clienti.cf
);

--creazione tabella esercenti
CREATE TABLE esercenti(
    'id' INT NOT NULL AUTO_INCREMENT,
    'nome' VARCHAR(20) NOT NULL,
    'categoria' ENUM('supermercato', 'ristorante', 'autonoleggio', 'viaggi', 'intrattenimento', 'farmacia') NOT NULL, 
    'citta' VARCHAR(30) NOT NULL, 

    PRIMARY KEY ('id')
);

--creazione tabella acquisti (ha come FK gli esercenti e gli estratti conto)
CREATE TABLE acquisti(
    'id' VARCHAR(15) NOT NULL AUTO_INCREMENT, 
    'data' DATE NOT NULL, 
    'importo' FLOAT NOT NULL, 
    'esercente' INT NOT NULL, 
    'estratto_conto' VARCHAR(15) NOT NULL, 
    
    PRIMARY KEY (id), 
    FOREIGN KEY (esercente) REFERENCES esercenti.id,
    FOREIGN KEY (estratto_conto) REFERENCES estratti_conto.numero
);