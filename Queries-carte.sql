-- queries

--totale speso dai clienti per categoria di acqusto, trimestre e regione
SELECT 
    esercenti.categoria, 
    MONTH(acquisti.data) AS mese_acquisto, 
    esercente.citta, -- non so come si calcola la regione dato un indirizzo
    SUM(acquisti.importo) AS totale_speso
FROM acquisti 
JOIN clienti ON acquisti.id_acquisto
GROUP BY 
    acquisti.categoria, 
    acquisti.data, -- non so come si groupa per trimestre avendo il mese
    esercente.citta;


-- numero medio di acquisti nell'articolo di viaggio
