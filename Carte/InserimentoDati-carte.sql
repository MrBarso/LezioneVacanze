INSERT INTO clienti (cf, nome, fascia_reddito, sesso, data_nascita, indirizzo, saldo, numero_carta, cadenza_carta) VALUES 
('NRELEI70C01E625A', 'Elia Neri', 27000, 'maschio', '1987-03-01', 'Via Garibaldi 10, Livorno', 9, '000000000000', '2029-05-04'),
('MRTDGI96L09H501R', 'Diego Martelli', 46000, 'maschio', '1996-07-09', 'Via del Fagiano 2, Roma', 12, '000000000001', '2024-06-24'),
('VRDSRA90C03G301V', 'Sara Assuso', 50000, 'femmina', '1969-05-10', 'Via del Borgo 7, Napoli', 1, '000000000010', '2028-01-01'),
('NRNANR85D04H501Q', 'Annalisa Gelli', 51000, 'femmina', '1995-03-04', 'Via Senegal 3, Torino', 13, '000000000011', '2028-05-06');


INSERT INTO estratto_conto (data, importo_addebitato, codiceFiscale) VALUES 
('2024-01-01', 150.50, 'RSSMRA70A01H501Z'),
('2024-01-10', 200.75, 'BNCLCU80B02F205P'),
('2024-01-15', 100.00, 'VRDSRA90C03G301V'),
('2024-01-20', 250.00, 'NRNANR85D04H501Q'),
('2024-01-25', 175.25, 'GLLGRI75E05I202X'),
('2024-02-01', 300.00, 'RSSMRA70A01H501Z'),
('2024-02-10', 80.00, 'BNCLCU80B02F205P'),
('2024-02-15', 120.50, 'VRDSRA90C03G301V'),
('2024-02-20', 90.00, 'NRNANR85D04H501Q'),
('2024-02-25', 110.75, 'GLLGRI75E05I202X');


INSERT INTO acquisti (data, importo, esercente, categoria, citta, estrattoConto) VALUES 
('2024-01-02', 50.00, 'Supermercato XYZ', 'supermercato', 'Roma', 1),
('2024-01-03', 30.00, 'Ristorante ABC', 'ristorante', 'Milano', 2),
('2024-01-04', 100.00, 'Autonoleggio LMN', 'autonoleggio', 'Napoli', 3),
('2024-01-05', 200.00, 'Agenzia Viaggi OPQ', 'viaggi', 'Torino', 4),
('2024-01-06', 25.00, 'Cinema RST', 'intrattenimento', 'Palermo', 5),
('2024-01-07', 15.00, 'Farmacia UVW', 'farmacia', 'Roma', 6),
('2024-01-08', 75.00, 'Supermercato XYZ', 'supermercato', 'Milano', 7),
('2024-01-09', 60.00, 'Ristorante ABC', 'ristorante', 'Napoli', 8),
('2024-01-10', 150.00, 'Autonoleggio LMN', 'autonoleggio', 'Torino', 9),
('2024-01-11', 120.00, 'Agenzia Viaggi OPQ', 'viaggi', 'Palermo', 10);


INSERT INTO promozioni (codice_promozione, nome_prodotto, inizio_promozione, fine_promozione) VALUES 
('PROMO1', 'Prodotto A', '2024-01-01', '2024-06-30'),
('PROMO2', 'Prodotto B', '2024-02-01', '2024-07-31');


INSERT INTO risposte_promozioni (codiceFiscale, codicePromozione, risposta) VALUES 
('RSSMRA70A01H501Z', 'PROMO1', 'si'),
('BNCLCU80B02F205P', 'PROMO1', 'no'),
('VRDSRA90C03G301V', 'PROMO1', 'si'),
('NRNANR85D04H501Q', 'PROMO2', 'si'),
('GLLGRI75E05I202X', 'PROMO2', 'no');