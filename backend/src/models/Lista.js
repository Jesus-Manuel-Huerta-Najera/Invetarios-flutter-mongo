const { Schema, model } = require('mongoose');

const ListaSchema = new Schema(
    {
        productos: { type: Array },
    },
    {
        timestamps: true,
    }
);

module.exports = model('Lista', ListaSchema);