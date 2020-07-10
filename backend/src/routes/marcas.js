const { Router } = require("express");
const router = Router();

const Marca = require("../models/Marca");

router.get("/api/marcas", async (req, res) => {
    const marcas = await Marca.find();
    res.json({ marcas: marcas });
});

router.post("/api/marcas", async (req, res) => {
    const marcas = await Marca.findById(req.body._id);
    res.json({ marcas: categmarcasorias });
});

router.post("/api/marcas/create", async (req, res) => {
    await Marca.create({
        name: req.body["name"],
        url: req.body["url"],
    });
    res.json({ message: "creado" });
});

router.post("/api/marcas/delete", async (req, res) => {
    await Marca.findByIdAndDelete(req.body._id);
    res.json({ message: "eliminado" });
});

router.post("/api/marcas/update", async (req, res) => {
    await Marca.findByIdAndUpdate(req.body._id, {
        name: req.body["name"],
        url: req.body["url"],
    });
    res.json({ message: "actualizado" });
});

module.exports = router;