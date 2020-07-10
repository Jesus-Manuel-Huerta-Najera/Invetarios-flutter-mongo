const { Schema, model } = require('mongoose');

const ProductoSchema = new Schema(
  {
    stack: { type: Number },
    precioCompra: { type: Number },
    precioVenta: { type: Number },
    marca: { type: String },
    descripcion: { type: String },
    barCode: { type: String },
    url: {type: String},
    departamento: {type: String},
    categoria: {type: String},
  },
  {
    timestamps: true,
  }
);

module.exports = model('Producto', ProductoSchema);