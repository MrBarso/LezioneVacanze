-- a)
SELECT compagnie.nome
FROM voli
JOIN compagnie ON voli.compagnia = compagnia.nome
WHERE volo.scalo = 'Milano'

-- b)
SELECT voli.numero
FROM voli
WHERE voli.scalo = 'Napoli'

-- c)
SELECT voli.numero
FROM voli
WHERE 
    voli.luogo_partenza = 'Torino'
    AND voli.soppresso = 'True'

-- d)
SELECT voli.pilota
FROM voli
WHERE voli.numero = 'AZ345'

-- e)
SELECT COUNT(voli.copilota)
FROM voli
WHERE 
    voli.luogo_destinazione = 'Bari'
    AND voli.compagnia = 'Alitalia'