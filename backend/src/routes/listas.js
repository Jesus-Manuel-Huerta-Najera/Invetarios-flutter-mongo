const { Router } = require("express");
const router = Router();

const Lista = require("../models/Lista");

router.get("/api/listas", async (req, res) => {
    const listas = await Lista.find();
    res.json({ listas: listas });
});

router.post("/api/listas", async (req, res) => {
    const listas = await Lista.findById(req.body._id);
    res.json({ listas: listas });
});

router.post("/api/listas/create", async (req, res) => {
    await Lista.create({
        productos: req.body["productos"],
    });
    res.json({ message: "creado" });
});

router.post("/api/listas/delete", async (req, res) => {
    await Lista.findByIdAndDelete(req.body._id);
    res.json({ message: "eliminado" });
});

router.post("/api/listas/update", async (req, res) => {
    await Lista.findByIdAndUpdate(req.body._id, {
        productos: req.body["productos"],
    });
    res.json({ message: "actualizado" });
});

module.exports = router;