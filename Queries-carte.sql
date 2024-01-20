-- queries

--totale speso dai clienti per categoria di acqusto, trimestre e regione
SELECT 
    acquisti.categoria, 
    MONTH(acquisti.data) AS mese_acquisto, 
    clienti.indirizzo, -- non so come si calcola la regione dato un indirizzo
    SUM(acquisti.importo) AS totale_speso
FROM acquisti 
JOIN clienti ON acquisti.id_acquisto
GROUP BY 
    acquisti.categoria, 
    acquisti.data, -- non so come si groupa per trimestre avendo il mese
    clienti.indirizzo

-- 2)
SELECT 
    YEAR(acquisti.data) AS anno_acquisto, 
    estratto_conto.id_estratto_conto, 
    clienti.indirizzo, 
    AVG(IF(acquisti.categoria = 'viaggi', 1, NULL)) AS acquisti_viaggi_media
FROM acquisti
JOIN estratto_conto ON acquisti.id_acquisto
JOIN clienti ON acquisti.id_acquisto
WHERE 
    anno_acquisto = 2023
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000
GROUP BY 
    estratto_conto.id_estratto_conto, 
    clienti.indirizzo

-- 3)
SELECT
    clienti.indirizzo, 
    MONTH(acquisti.data) AS mese_acquisto, 
    SUM(acquisti.importo) AS totale_speso

FROM acquisti
JOIN clienti ON acquisti.id_acquisto
GROUP BY 
    mese_acquisto, 
    clienti.indirizzo

-- 4)
SELECT
    clienti.fascia_reddito, 
    promozioni.nome_prodotto, 
    COUNT(risposte_promozioni.risposta = 'si') AS adesioni
FROM risposte_promozioni
JOIN clienti ON risposte_promozioni.codiceFiscale = codice_fiscale
JOIN promozioni ON risposte_promozioni.codicePromozione = codice_promozione
GROUP BY
    promozioni.nome_prodotto, 
    clienti.fascia_reddito

-- 5)
SELECT
    COUNT(risposte_promozioni.risposta = 'si') AS adesioni
FROM
    risposte_promozioni
JOIN clienti ON risposte_promozioni.codiceFiscale = codice_fiscale
JOIN promozioni ON risposte_promozioni.codicePromozione = codice_promozione
WHERE 
    promozioni.nome_prodotto = 'orologio'
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000
