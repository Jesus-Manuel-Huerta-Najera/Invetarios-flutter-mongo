const { Router } = require('express');
const router = Router();

const User = require('../models/User');

const faker = require('faker');

router.get('/api/users', async (req, res) => {
    const users = await User.find();
    res.json({users: users});
});

router.post("/api/users", async (req, res) => {
    const users = await User.findById(req.body._id);
    res.json({ users: users });
});


router.post('/api/users/create', async (req, res)=> {
    console.log(req.body);
    res.send(200, {message: 'listo'})
});

router.get('/api/users/create', async (req, res) => {
    for(let i = 0; i < 5; i++){
        await User.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            avatar: faker.image.avatar(),
        });
    }
    res.json({message: '5 Users created'});
});

module.exports = router;