-- queries

-- totale speso dai clienti per categoria di acqusto, trimestre e regione
SELECT 
    SUM(acquisti.importo) AS totale_speso
FROM acquisti 
JOIN esercenti ON acquisti.esercente
WHERE esercenti.categoria = 'ESEMPIO'; -- cambiare esempio o parametro

-- numero medio di acquisti di categoria "articolo da viaggio" dei clienti con reddito tra 50000 e 60000 in un certo anno per estratto conto e città dell'esercente
/*SELECT 
    AVG(IF(esercenti.categoria = 'viaggi', 1, NULL)) AS acquisti_viaggi_media
FROM esercenti
JOIN acquisti ON acquisti.esercente 
AND estratto_conto ON acquisti.id 
AND clienti ON acquisti.cliente
WHERE 
    YEAR(acquisti.data) = 2024 -- cambiare anno o parametro
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000;*/


-- ammontare totale speso in viaggi dai clienti per mese della spesa e per provincia dell'esercente

SELECT 
    SUM(acquisti.importo) AS totale_speso
FROM acquisti
JOIN esercenti ON acquisti.esercente
WHERE esercenti.categoria = 'ESEMPIO'; -- cambiare esempio o parametro


-- Numero di adesioni e promozioni per prodotto e per fascia di reddito dei clienti

/*SELECT
    promozioni.nome_prodotto, 
    clienti.fascia_reddito, 
    COUNT(offerte.risposta = 'si') AS adesioni
    COUNT(offerte.risposta) AS promozioni
FROM offerte, promozioni, clienti
JOIN clienti ON offerte.cf
WHERE 
    promozioni.nome_prodotto = 'ESEMPIO'
    AND clienti.fascia_reddito >= "ESEMPIO"
    AND clienti.fascia_reddito < "ESEMPIO";*/


-- numero dei clienti con fascia di reddito tra 50000 e 60000 che hanno accettato un'offerta di orologi 
/*SELECT
    COUNT(offerte.risposta = 'si') AS adesioni
FROM
    offerte
JOIN clienti ON offerte.cf AND promozioni ON offerte.codice
WHERE 
    promozioni.nome_prodotto = "orologio"
    AND clienti.fascia_reddito >= 50000
    AND clienti.fascia_reddito < 60000;*/
