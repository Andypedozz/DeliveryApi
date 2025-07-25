INSERT INTO Prodotto (Codice, Nome, Prezzo, Descrizione) VALUES
(1, 'Pizza Margherita', 8, 'Pomodoro, mozzarella, basilico'),
(2, 'Pizza Diavola', 9, 'Salame piccante, mozzarella'),
(3, 'Pizza 4 Formaggi', 10, 'Mozzarella, gorgonzola, fontina, parmigiano'),
(4, 'Panino Classico', 6, 'Hamburger, lattuga, pomodoro'),
(5, 'Panino Vegano', 7, 'Burger vegetale, verdure grigliate'),
(6, 'Insalata Mista', 5, 'Verdure fresche di stagione'),
(7, 'Pasta al Pomodoro', 7, 'Spaghetti, sugo di pomodoro'),
(8, 'Lasagna', 9, 'Pasta al forno, carne, besciamella'),
(9, 'Tiramisù', 4, 'Dolce al cucchiaio con caffè e mascarpone'),
(10, 'Acqua Naturale', 1, 'Bottiglia da 0.5L'),
(11, 'Acqua Frizzante', 1, 'Bottiglia da 0.5L'),
(12, 'Coca Cola', 2, 'Lattina 0.33L'),
(13, 'Fanta', 2, 'Lattina 0.33L'),
(14, 'Birra', 3, 'Bottiglia 0.33L'),
(15, 'Caffè', 1, 'Espresso italiano');

INSERT INTO Zona (Nome) VALUES
('Centro'),
('Nord'),
('Sud'),
('Est'),
('Ovest'),
('San Paolo'),
('San Lorenzo'),
('Tiburtina'),
('Trastevere'),
('Eur'),
('Parioli'),
('Garbatella'),
('Monteverde'),
('Pigneto'),
('Testaccio');

INSERT INTO Indirizzo (Codice, Nome, Civico, Cap, Zona) VALUES
(1, 'Via Roma', 10, 00100, 'Centro'),
(2, 'Via Milano', 25, 00101, 'Nord'),
(3, 'Via Napoli', 30, 00102, 'Sud'),
(4, 'Via Torino', 5, 00103, 'Est'),
(5, 'Via Firenze', 15, 00104, 'Ovest'),
(6, 'Via Bari', 18, 00105, 'San Paolo'),
(7, 'Via Lecce', 20, 00106, 'San Lorenzo'),
(8, 'Via Venezia', 22, 00107, 'Tiburtina'),
(9, 'Via Genova', 12, 00108, 'Trastevere'),
(10, 'Via Palermo', 9, 00109, 'Eur'),
(11, 'Via Bologna', 16, 00110, 'Parioli'),
(12, 'Via Cagliari', 13, 00111, 'Garbatella'),
(13, 'Via Ancona', 7, 00112, 'Monteverde'),
(14, 'Via Modena', 4, 00113, 'Pigneto'),
(15, 'Via Torino', 3, 00114, 'Testaccio');

INSERT INTO Cliente (Codice, Nome, Cognome, Indirizzo, Telefono) VALUES
(1, 'Anna', 'Rossi', 1, '3401234567'),
(2, 'Marco', 'Verdi', 2, '3409876543'),
(3, 'Laura', 'Bianchi', 3, '3403332211'),
(4, 'Giovanni', 'Neri', 4, '3404445566'),
(5, 'Sofia', 'Conti', 5, '3407778899'),
(6, 'Alessandro', 'Ricci', 6, '3401122334'),
(7, 'Elena', 'Greco', 7, '3409988776'),
(8, 'Francesco', 'Esposito', 8, '3407766554'),
(9, 'Chiara', 'Costa', 9, '3406655443'),
(10, 'Andrea', 'Ferri', 10, '3405544332'),
(11, 'Lucia', 'Barbieri', 11, '3404433221'),
(12, 'Matteo', 'De Santis', 12, '3403211234'),
(13, 'Valentina', 'Marino', 13, '3402345678'),
(14, 'Davide', 'Romano', 14, '3403456789'),
(15, 'Irene', 'Gallo', 15, '3404567890');

INSERT INTO Ordine (Codice, CodiceCliente, Nominativo, CodiceIndirizzo, Stato, TipoPagamento, Note, CodiceRider, OrarioConsegna) VALUES
(1, 1, 'Anna Rossi', 1, 'Consegnato', 'Contanti', NULL, 1,'18:15'),
(2, 2, 'Marco Verdi', 2, 'In consegna', 'Carta', NULL, 2,'18:15'),
(3, 3, 'Laura Bianchi', 3, 'Da assegnare', 'Carta', NULL, 3,'18:15'),
(4, 4, 'Giovanni Neri', 4, 'Consegnato', 'Contanti', NULL, 4,'18:15'),
(5, 5, 'Sofia Conti', 5, 'In consegna', 'Contanti', NULL, 5,'18:15'),
(6, 6, 'Alessandro Ricci', 6, 'Consegnato', 'Carta', NULL, 6,'18:15'),
(7, 7, 'Elena Greco', 7, 'Annullato', 'Contanti', NULL, 7,'18:15'),
(8, 8, 'Francesco Esposito', 8, 'Consegnato', 'Carta', NULL, 8,'18:15'),
(9, 9, 'Chiara Costa', 9, 'In consegna', 'Contanti', NULL, 9,'18:15'),
(10, 10, 'Andrea Ferri', 10, 'Da assegnare', 'Contanti', NULL, 10,'18:15'),
(11, 11, 'Lucia Barbieri', 11, 'Consegnato', 'Carta', NULL, 11,'18:15'),
(12, 12, 'Matteo De Santis', 12, 'Consegnato', 'Contanti', NULL, 12,'18:15'),
(13, 13, 'Valentina Marino', 13, 'In consegna', 'Carta', NULL, 13,'18:15'),
(14, 14, 'Davide Romano', 14, 'Da assegnare', 'Carta', NULL, 14,'18:15'),
(15, 15, 'Irene Gallo', 15, 'Consegnato', 'Contanti', NULL, 15,'18:15');

INSERT INTO ProdottiOrdine (CodiceProdotto, CodiceOrdine, Quantita) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 3, 2),
(6, 4, 1),
(7, 5, 1),
(8, 5, 1),
(9, 6, 3),
(10, 7, 2),
(11, 8, 1),
(12, 9, 2),
(13, 10, 2),
(14, 11, 1),
(15, 12, 1),
(1, 13, 1),
(2, 13, 1),
(3, 14, 1),
(4, 15, 2),
(5, 15, 1);