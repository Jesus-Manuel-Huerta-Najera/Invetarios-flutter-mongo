const { Router } = require("express");
const router = Router();

const Orden = require("../models/Orden");

router.get("/api/ordenes", async (req, res) => {
    const ordenes = await Orden.find();
    res.json({ ordenes: ordenes });
});

router.post("/api/ordenes", async (req, res) => {
    const ordenes = await Orden.findById(req.body._id);
    res.json({ ordenes: ordenes });
});

router.post("/api/ordenes/create", async (req, res) => {
    await Orden.create({
        cliente: req.body["cliente"],
        lista: req.body["lista"],
        precio: req.body["precio"],
        pagado: req.body["pagado"],
    });
    res.json({ message: "creado" });
});

router.post("/api/ordenes/delete", async (req, res) => {
    await Orden.findByIdAndDelete(req.body._id);
    res.json({ message: "eliminado" });
});

router.post("/api/ordenes/update", async (req, res) => {
    await Orden.findByIdAndUpdate(req.body._id, {
        cliente: req.body["cliente"],
        lista: req.body["lista"],
        precio: req.body["precio"],
        pagado: req.body["pagado"],
    });
    res.json({ message: "actualizado" });
});

module.exports = router;