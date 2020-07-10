const express = require('express');
const bodyParser = require('body-parser');
const app = express();

const morgan = require('morgan');
const cors = require('cors');

app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

app.use(morgan('dev'));
app.use(cors());

app.use(require('./routes/users'));
app.use(require("./routes/productos"));
app.use(require('./routes/departamentos'));
app.use(require('./routes/categorias'));
app.use(require('./routes/clientes'));
app.use(require('./routes/listas'));
app.use(require('./routes/productos'));
app.use(require('./routes/ordenes'));
app.use(require('./routes/marcas'));

module.exports = app;