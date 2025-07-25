const express = require('express');
const sqlite3 = require("sqlite3").verbose()
const path = require("path")
const { fetchFirst, fetchAll, execute } = require("./db/db_wrapper.js"); 

const app = express();

const PORT = 5000;

app.use(express.json());
app.use(express.static(path.join(__dirname, "/")));

const db = new sqlite3.Database("./db/database.db", (err) => {
    if(err) console.log("Errore nella connessione al DB: "+err.message); 
    else console.log("Connesso al database SQLite");     
});

app.get("/riders", async (req, res) => {

  const query = "SELECT * FROM Rider";

  try{
    const riders = await fetchAll(db, query, []);
    res.json(riders);
  }catch(err) {
    res.json({ error: err})
  }
})

// ENDPOINT ORDINI
app.get('/orders', async (req, res) => {
    const query = `SELECT Cliente.Nome as Nome, Cliente.Cognome,
                Indirizzo.Nome as Indirizzo, Indirizzo.Civico, Indirizzo.Zona, Indirizzo.Cap,
                Ordine.TipoPagamento, Ordine.OrarioConsegna
                FROM Cliente, Indirizzo, Ordine
                WHERE Cliente.Codice = Ordine.CodiceCliente
                AND Ordine.CodiceIndirizzo = Indirizzo.Codice`;
    
    try{
        const orders = await fetchAll(db, query, []);
        return res.json(orders);
    } catch(err) {
        return res.json({ error: err })
    }
});

app.get('/daAssegnare', async (req, res) => {
    const query = `SELECT Cliente.Nome as Nome, Cliente.Cognome,
                Indirizzo.Nome as Indirizzo, Indirizzo.Civico, Indirizzo.Zona, Indirizzo.Cap,
                Ordine.TipoPagamento, Ordine.OrarioConsegna, Ordine.Stato, Ordine.Codice
                FROM Cliente, Indirizzo, Ordine
                WHERE Cliente.Codice = Ordine.CodiceCliente
                AND Ordine.CodiceIndirizzo = Indirizzo.Codice
                AND Stato = 'Da assegnare'`;

    try{
        const orders = await fetchAll(db, query, []);
        return res.json(orders);
    } catch(err) {
        return res.json({ error: err })
    }
});

app.get('/inConsegna', async (req, res) => {
    let query = `SELECT Cliente.Nome as Nome, Cliente.Cognome,
                Indirizzo.Nome as Indirizzo, Indirizzo.Civico, Indirizzo.Zona, Indirizzo.Cap,
                Ordine.TipoPagamento, Ordine.OrarioConsegna, Ordine.Stato, Ordine.Codice
                FROM Cliente, Indirizzo, Ordine
                WHERE Cliente.Codice = Ordine.CodiceCliente
                AND Ordine.CodiceIndirizzo = Indirizzo.Codice
                AND Stato = 'In consegna'`;
    let riderId;
    try{
        riderId = req.user.id;
    }catch {
        riderId = null;
    }
    query = (riderId)? (query+"AND CodiceRider = ?"): query;
    
    try{
        const orders = await fetchAll(db, query, (riderId)? [riderId] : []);
        return res.json(orders);
    } catch(err) {
        return res.json({ error: err })
    }
});

app.get('/consegnati', async (req, res) => {
    let query = `SELECT Cliente.Nome as Nome, Cliente.Cognome,
                Indirizzo.Nome as Indirizzo, Indirizzo.Civico, Indirizzo.Zona, Indirizzo.Cap,
                Ordine.TipoPagamento, Ordine.OrarioConsegna, Ordine.Stato, Ordine.Codice
                FROM Cliente, Indirizzo, Ordine
                WHERE Cliente.Codice = Ordine.CodiceCliente
                AND Ordine.CodiceIndirizzo = Indirizzo.Codice
                AND Stato = 'Consegnato'`;
    let riderId;
    try{
        riderId = req.user.id;
    }catch {
        riderId = null;
    }
    query = (riderId)? (query+"AND CodiceRider = ?") : query;
    
    try{
        const orders = await fetchAll(db, query, (riderId)? [riderId] : []);
        return res.json(orders);
    } catch(err) {
        return res.json({ error: err })
    }
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
