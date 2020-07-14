const { Router } = require("express");
const router = Router();

const Producto = require("../models/Producto");

const faker = require("faker");

router.get("/api/productos", async (req, res) => {
  const productos = await Producto.find();
  res.json({ productos: productos });
});

router.post("/api/productos", async (req, res) => {
  const productos = await Producto.findById(req.body._id);
  res.json({ productos: productos });
});


router.post("/api/productos/create", async (req, res) => {
    await Producto.create({
      stack: req.body["stack"],
      precioCompra: req.body["precioCompra"],
      precioVenta: req.body["precioVenta"],
      marca: req.body["marca"],
      descripcion: req.body["descripcion"],
      barCode: req.body["barCode"],
      departamento: req.body["departamento"],
      categoria: req.body["categoria"],
      url: req.body["url"],
    });
  res.json({ message: "creado" });
});

router.post("/api/productos/delete", async (req, res) => {
  await Producto.findByIdAndDelete(req.body._id);
  res.json({ message: "eliminado" });
});

router.post("/api/productos/update", async (req, res) => {
  await Producto.findByIdAndUpdate(req.body._id, {
    stack: req.body["stack"],
    precioCompra: req.body["precioCompra"],
    precioVenta: req.body["precioVenta"],
    marca: req.body["marca"],
    descripcion: req.body["descripcion"],
    barCode: req.body["barCode"],
    url: req.body["url"],
  });
  res.json({ message: "actualizado" });
});


router.get("/api/productos/create", async (req, res) => {
  for (let i = 0; i < 5; i++) {
    await Producto.create({
      stack: i,
      precioCompra: 100,
      precioVenta: 120,
      marca: faker.company.companyName.name,
      descripcion: faker.lorem.words(14),
      barCode: faker.random.alphaNumeric,
      url: faker.image.avatar()
    });
  }
  res.json({ message: "5 productos creados" });
});

module.exports = router;