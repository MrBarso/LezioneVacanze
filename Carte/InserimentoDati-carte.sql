INSERT INTO clienti (cf, nome, fascia_reddito, sesso, data_nascita, indirizzo, saldo, numero_carta, cadenza_carta) VALUES 
('NRELEI70C01E625A', 'Elia Neri', 27000, 'maschio', '1987-03-01', 'Via Garibaldi 10, Livorno', 9, '000000000000', '2029-05-04'),
('MRTDGI96L09H501R', 'Diego Martelli', 46000, 'maschio', '1996-07-09', 'Via del Fagiano 2, Roma', 12, '000000000001', '2024-06-24'),
('SSSSRA69E50D969C', 'Sara Assuso', 50000, 'femmina', '1969-05-10', 'Via del Borgo 7, Napoli', 1, '000000000010', '2028-01-01'),
('GLLNLS95C44L219R', 'Annalisa Gelli', 51000, 'femmina', '1995-03-04', 'Via Senegal 3, Torino', 13, '000000000011', '2028-05-06');


INSERT INTO estratti_conto (dat, totale_spesa, cf) VALUES 
('2024-01-02', 110.00, 'NRELEI70C01E625A'),
('2024-05-10', 40.50, 'MRTDGI96L09H501R'),
('2024-01-16', 300.30, 'NRELEI70C01E625A'),
('2024-02-20', 25.00, 'SSSSRA69E50D969C'),
('2024-01-25', 164.25, 'GLLNLS95C44L219R'),
('2024-06-01', 54.60, 'GLLNLS95C44L219R'),
('2024-02-20', 87.00, 'NRELEI70C01E625A'),
('2024-10-15', 130.50, 'MRTDGI96L09H501R');

INSERT INTO esercenti (nome, categoria, citta) VALUES
('Maldive resort', 'viaggi', 'Torino'),
('Conad', 'supermercato', 'Milano'),
('Farmacia Betti', 'farmacia', 'Roma');

INSERT INTO acquisti (dat, importo, esercente, estratto_conto, cliente) VALUES 
('2024-10-23', 40.00, 1, 1, 'NRELEI70C01E625A'),
('2024-09-23', 60.00, 2, 2, 'MRTDGI96L09H501R'),
('2024-08-23', 99.99, 3, 3, 'SSSSRA69E50D969C'),
('2024-07-23', 4.50, 1, 4, 'GLLNLS95C44L219R'),
('2024-06-23', 25.00, 2, 5, 'MRTDGI96L09H501R'),
('2024-05-23', 19.00, 3, 6, 'GLLNLS95C44L219R')


INSERT INTO promozioni (codice, nome_prodotto, costo_prodotto, data_inizio, data_fine) VALUES 
('1', 'prodotto1', 30.00, '2024-03-21', '2024-03-28'),
('2', 'prodotto2', 50.00, '2024-04-16', '2024-04-23');


INSERT INTO offerte (cf, codice, risposta) VALUES 
('NRELEI70C01E625A', '1', 'si'),
('MRTDGI96L09H501R', '2', 'no'),
('SSSSRA69E50D969C', '1', 'no'),
('GLLNLS95C44L219R', '2', 'si');