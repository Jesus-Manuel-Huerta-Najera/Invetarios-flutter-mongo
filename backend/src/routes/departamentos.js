const { Router } = require("express");
const router = Router();

const Departamento = require("../models/Departamento");

router.get("/api/departamentos", async (req, res) => {
    const departamentos = await Departamento.find();
    res.json({ departamentos: departamentos });
});

router.post("/api/departamentos", async (req, res) => {
    const departamentos = await Departamento.findById(req.body._id);
    res.json({ departamentos: departamentos });
});

router.post("/api/departamentos/create", async (req, res) => {
    await Departamento.create({
        name: req.body["name"],
        url: req.body["url"],
    });
    res.json({ message: "creado" });
});

router.post("/api/departamentos/delete", async (req, res) => {
    await Departamento.findByIdAndDelete(req.body._id);
    res.json({ message: "eliminado" });
});

router.post("/api/departamentos/update", async (req, res) => {
    await Departamento.findByIdAndUpdate(req.body._id, {
        name: req.body["name"],
        url: req.body["url"],
    });
    res.json({ message: "actualizado" });
});

module.exports = router;