-- queries

--totale speso dai clienti per categoria di acqusto, trimestre e regione
SELECT 
    esercenti.categoria, 
    MONTH(acquisti.data) AS mese_acquisto, 
    esercenti.citta,
    SUM(acquisti.importo) AS totale_speso
FROM acquisti 
JOIN clienti ON acquisti.id
GROUP BY 
    acquisti.categoria, 
    acquisti.data,
    esercenti.citta;


-- numero medio di acquisti degli articoli da viaggio dei clienti con fascia di reddito tra 50.000 e 60.000 per conto e citta

SELECT 
    YEAR(acquisti.data) AS anno_acquisto, 
    estratti_conto.id, 
    esercenti.citta, 
    AVG(IF(acquisti.categoria = 'viaggi', 1, NULL)) AS acquisti_articoliviaggio_media
FROM acquisti
JOIN estratto_conto ON acquisti.id_acquisto
JOIN clienti ON acquisti.id_acquisto
WHERE 
    anno_acquisto = 2023
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000
GROUP BY 
    estratti_conto.id, 
    clienti.indirizzo

-- totale speso in viaggi per mese e provincia
SELECT
    SUM(IF(acquisti.categoria = 'viaggi', 1, NULL)) AS totale,
    MONTH(acquisti.data) AS mese_acquisto, 
    esercenti.citta
FROM acquisti
JOIN clienti ON acquisti.id
GROUP BY 
    mese_acquisto, 
    clienti.indirizzo
