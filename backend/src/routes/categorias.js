const { Router } = require("express");
const router = Router();

const Categoria = require("../models/Categoria");

router.get("/api/categorias", async (req, res) => {
    const categorias = await Categoria.find();
    res.json({ categorias: categorias });
});

router.post("/api/categorias", async (req, res) => {
    const categorias = await Categoria.findById(req.body._id);
    res.json({ categorias: categorias });
});

router.post("/api/categorias/create", async (req, res) => {
    await Categoria.create({
        name: req.body["name"],
        url: req.body["url"],
    });
    res.json({ message: "creado" });
});

router.post("/api/categorias/delete", async (req, res) => {
    await Categoria.findByIdAndDelete(req.body._id);
    res.json({ message: "eliminado" });
});

router.post("/api/categorias/update", async (req, res) => {
    await Categoria.findByIdAndUpdate(req.body._id, {
        name: req.body["name"],
        url: req.body["url"],
    });
    res.json({ message: "actualizado" });
});

module.exports = router;