// api thống kê với xóa username
const userRoutes = require('express').Router();
const userController = require('../controllers/userController');
const upload = require('../middleware/upload');

userRoutes.get('/', userController.getAllUser);
userRoutes.get('/:id', userController.getUserbyId);
userRoutes.put('/:id', upload.single('avatar'), userController.updateUser);
userRoutes.get('/users/total', userController.getTotalUsers);
userRoutes.put('/:id/lock', userController.toggleLock);

module.exports = userRoutes;