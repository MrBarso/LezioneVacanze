-- queries sul database 'magistrali'

-- numero di esami superati e studenti che hanno sostenuto l'esame per nome del corso, anno accademico e sessione

SELECT 
    corso.nome_corso
    esame.anno_accademico
    esame.sessione
    COUNT(CASE WHEN esame.voto>17) AS numero_esami_superati
    COUNT(DISTINCT esame.studente_matricola) AS numero_studenti_esami_sostenuti
FROM esame
  JOIN corso ON esame.corso_sigla = corso.sigla
GROUP BY 
  corso.sigla, 
  esame.anno_accademico, 
  esame.sessione;


-- numero di esami non supearti per anno accademico, sessione e università di laurea

SELECT 
    esame.anno_accademico
    esame.sessione
    studente.nome_universita
    COUNT(CASE WHEN esame.voto<18) AS numero_esami_non_superati
FROM esame
  JOIN studente ON esame.studente_matricola = studente.matricola
GROUP BY 
  esame.anno_accademico, 
  esame.sessione, 
  studente.nome_universita;

--di un certo corso di laurea e anno di iscrizione, voto medio degli esami supearti e totale CFU acquisiti per sesso dello studente

SELECT 
    esame.anno_accademico
    esame.sessione
    corso.nome_corso
    studente.sesso,
    AVG(esame.voto) AS voto_medio_esami_superati
    SUM(corso.crediti) AS totale_cfu_acquisiti

WHERE 
    esame.voto>17,
    studente.corso = "ESEMPIO",
    studente.anno_iscrizione = "ESEMPIO"
    
FROM esame

  JOIN corso ON esame.corso_sigla = corso.sigla
  JOIN studente ON esame.studente_matricola = studente.matricola

GROUP BY 
  studente.sesso;

-- voto medio esami superati, numero studenti che hanno sostenuto l'esame e percentuale numero studenti che lo hanno superato, per nome del corso, sessione e anno accademico

SELECT 
    esame.anno_accademico
    esame.sessione
    corso.nome_corso
    AVG(IF(esame.voto > 17, esame.voto, NULL)) AS voto_medio_esami_superati
    COUNT(DISTINCT esame.studente_matricola) AS numero_studenti_esami_sostenuti
    SUM(CASE WHEN esame.voto>17)/COUNT(DISTINCT esame.studente_matricola) * 100 AS percentuale_numero_studenti_esami_sostenuti

FROM esame
  JOIN corso ON esame.corso_sigla = corso.sigla

GROUP BY 
  esame.anno_accademico, 
  esame.sessione, 
  corso.nome_corso;