const { Schema, model } = require('mongoose');

const OrdenSchema = new Schema(
    {
        cliente: { type: String },
        lista: { type: String },
        precio: { type: Number },
        pagado: { type: Boolean},
    },
    {
        timestamps: true,
    }
);

module.exports = model('Orden', OrdenSchema);