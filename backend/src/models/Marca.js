const { Schema, model } = require('mongoose');

const MarcaSchema = new Schema(
    {
        name: { type: String },
        url: { type: String },
    },
    {
        timestamps: true,
    }
);

module.exports = model('Marca', MarcaSchema);