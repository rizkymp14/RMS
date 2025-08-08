// node/server.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const stokRoutes = require('./routes/stokRoutes');
const menuRoutes = require('./routes/menuRoutes');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use('/api/stok', stokRoutes);
app.use('/api/menu', menuRoutes);

app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
});
