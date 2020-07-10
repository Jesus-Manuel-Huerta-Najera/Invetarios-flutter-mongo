const { Router } = require("express");
const router = Router();

const Cliente = require("../models/Cliente");

router.get("/api/clientes", async (req, res) => {
    const clientes = await Cliente.find();
    res.json({ clientes: clientes });
});

router.post("/api/clientes", async (req, res) => {
    const clientes = await Cliente.findById(req.body._id);
    res.json({ clientes: clientes });
});

router.post("/api/clientes/create", async (req, res) => {
    await Cliente.create({
        name: req.body["name"],
        phone: req.body["phone"],
    });
    res.json({ message: "creado" });
});

router.post("/api/clientes/delete", async (req, res) => {
    await Cliente.findByIdAndDelete(req.body._id);
    res.json({ message: "eliminado" });
});

router.post("/api/clientes/update", async (req, res) => {
    await Cliente.findByIdAndUpdate(req.body._id, {
        name: req.body["name"],
        phone: req.body["phone"],
    });
    res.json({ message: "actualizado" });
});

module.exports = router;