-- queries sul database 'magistrali'

-- numero di esami superati

-- per nome del corso
SELECT
    COUNT(CASE WHEN voto >= 18) AS studenti_passati
FROM esame
WHERE corso_sigla = esempio;

-- per anno accademico
SELECT
    COUNT(CASE WHEN voto >= 18) AS studenti_passati
FROM esame
WHERE anno_accademico = 2023; -- esempio

-- per sessione
SELECT
    COUNT(CASE WHEN voto >= 18) AS studenti_passati
FROM esame
WHERE sessione = estiva; -- esempio


-- numero di studenti che hanno sostenuto l'esame (solo per nome del corso come esempio)
SELECT
    COUNT(DISTINCT esame.studente_matricola) AS studenti_passati
FROM esame
WHERE corso_sigla = esempio;


-- numero di esami non superati: uguale agli esami superati ma il CASE WHEN diventa CASE WHEN 'voto' <= 17


-- media voti e somma crediti per corso e anno, organizzati per sesso dello studente
SELECT 
  corso.nome_corso, 
  studente.anno_iscrizione, 
  studente.sesso, 
  AVG(esame.voto) AS media, 
  SUM(corso.crediti) AS crediti_totali
FROM esame
JOIN studente ON esame.studente_matricola = studente.matricola
JOIN corso ON esame.corso_sigla = corso.sigla
WHERE
  esame.voto >= 18
  AND corso.nome_corso = 'esempio'
  AND studente.anno_iscrizione = esempio
GROUP BY studente.sesso;


--voto medio esami superati per nome del corso
SELECT
    esame.voto,
    AVG(esame.voto) AS media_totale
FROM esame
WHERE
    esame.voto>=18
    corso.nome_corso = 'esempio'


-- percentuale degli studenti che hanno superato l'esame per nome del corso
SELECT
    esame.voto,
    esame.studente_matricola;
    SUM(esame.voto >= 18) / COUNT(DISTINCT esame.studente_matricola) * 100 AS percentuale_superati
FROM esame
WHERE
    corso.nome_corso = 'esempio'