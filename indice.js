const express = require('express');
const mysql = require('mysql');

const app = express();
const port = 3000;

// Conexión a MySQL
const db = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DB
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Conectado a la base de datos MySQL');
});

// Ruta principal
app.get('/', (req, res) => {
  res.send('¡Servidor Node.js conectado a MySQL!');
});

// Iniciar servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});