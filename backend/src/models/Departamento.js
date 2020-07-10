const { Schema, model } = require('mongoose');

const DepartamentoSchema = new Schema(
    {
        name: { type: String },
        url: { type: String },
    },
    {
        timestamps: true,
    }
);

module.exports = model('Departamento', DepartamentoSchema);