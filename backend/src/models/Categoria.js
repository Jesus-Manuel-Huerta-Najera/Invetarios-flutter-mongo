const { Schema, model } = require('mongoose');

const CategoriaSchema = new Schema(
    {
        name: { type: String },
        url: { type: String },
    },
    {
        timestamps: true,
    }
);

module.exports = model('Categoria', CategoriaSchema);