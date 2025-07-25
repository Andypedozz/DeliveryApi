CREATE TABLE Rider (
	Codice	INTEGER,
	Nome	TEXT,
	Cognome	TEXT,
	Email	TEXT,
	Telefono	TEXT,
	PRIMARY KEY(Codice)
)

CREATE TABLE Prodotto (
	Codice	INTEGER,
	Nome	TEXT,
	Prezzo	INTEGER,
	Descrizione	TEXT,
	PRIMARY KEY(Codice)
)

CREATE TABLE Zona (
	Nome	TEXT,
	PRIMARY KEY(Nome)
)

CREATE TABLE Indirizzo (
	Codice	INTEGER,
	Nome	TEXT,
	Civico	INTEGER,
	Cap	INTEGER,
	Zona	TEXT,
	PRIMARY KEY(Codice),
	FOREIGN KEY(Zona) REFERENCES Zona(Nome)
)

CREATE TABLE Cliente (
	Codice	INTEGER,
	Nome	TEXT,
	Cognome	TEXT,
	Indirizzo	INTEGER,
	Telefono	TEXT,
	PRIMARY KEY(Codice),
	FOREIGN KEY(Indirizzo) REFERENCES Indirizzo(Codice)
)

CREATE TABLE Ordine (
	Codice	INTEGER,
	CodiceCliente	INTEGER,
	Nominativo	TEXT,
	CodiceIndirizzo	INTEGER,
	Stato	TEXT,
	TipoPagamento	TEXT,
	Note	INTEGER,
	CodiceRider	INTEGER,
	PRIMARY KEY(Codice),
	FOREIGN KEY(CodiceCliente) REFERENCES Cliente(Codice),
	FOREIGN KEY(CodiceIndirizzo) REFERENCES Indirizzo(Codice),
	FOREIGN KEY(CodiceRider) REFERENCES Rider(Codice)
)

CREATE TABLE ProdottiOrdine (
	CodiceProdotto	INTEGER,
	CodiceOrdine	INTEGER,
	Quantita	INTEGER,
	PRIMARY KEY(CodiceProdotto,CodiceOrdine)
)

CREATE TABLE RefreshToken (
	Token	TEXT,
	CodiceRider	INTEGER,
	Expires	INTEGER,
	PRIMARY KEY(Token)
)