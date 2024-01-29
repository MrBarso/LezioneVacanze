-- queries sul database 'magistrali'

-- numero di esami superati e studenti che hanno sostenuto l'esame per nome del corso, anno accademico e sessione

SELECT COUNT(*) AS esami_superati
FROM esame 
JOIN corso ON esame.corso_sigla
WHERE esame.voto>17 AND corso.sigla = 'ESEMPIO'; -- cambiare nome corso o cambiare condizione per gli altri parametri

SELECT COUNT(DISTINCT esame.studente_matricola) AS esami_sostenuti
FROM esame 
JOIN corso ON esame.corso_sigla
WHERE corso.sigla = 'ESEMPIO'; -- cambiare nome corso


-- numero di esami non supearti per nome del corso, anno accademico, sessione e università di laurea

SELECT 
	COUNT(*) AS esami_non_superati
FROM esame 
JOIN corso ON esame.corso_sigla
WHERE esame.voto<18 AND corso.sigla = 'ESEMPIO'; -- cambiare nome corso o cambiare condizione per gli altri parametri



-- di un certo corso di laurea e anno di iscrizione, voto medio degli esami supearti e totale CFU acquisiti per sesso dello studente

SELECT 
    AVG(IF(esame.voto < 18, esame.voto, NULL)) AS voto_medio_superati, 
    SUM(corso.crediti) AS cfu_totali
FROM esame 
JOIN corso ON esame.corso_sigla
WHERE esame.voto >= 18 AND corso.sigla = 'ESEMPIO'; -- cambiare nome corso o cambiare condizione per gli altri parametri


-- voto medio esami superati, numero studenti che hanno sostenuto l'esame e percentuale numero studenti che lo hanno superato, per nome del corso, sessione e anno accademico

SELECT 
    AVG(IF(esame.voto > 17, esame.voto, NULL)) AS voto_medio_superati,
    COUNT(DISTINCT esame.studente_matricola) AS numero_studenti_sostenuto,
    SUM(esame.voto) / COUNT(esame.studente_matricola) * 100 AS percentuale_superati
FROM esame 
JOIN studente ON esame.studente_matricola
WHERE esame.voto>17 AND esame.corso_sigla = 'ESEMPIO'; -- cambiare nome corso o cambiare condizione per gli altri parametri