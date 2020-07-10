const { Schema, model } = require('mongoose');

const ClienteSchema = new Schema(
    {
        name: { type: String },
        phone: { type: String },
    },
    {
        timestamps: true,
    }
);

module.exports = model('Cliente', ClienteSchema);