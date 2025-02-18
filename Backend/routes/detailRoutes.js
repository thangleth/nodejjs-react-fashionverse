const detailRoutes = require('express').Router();
const detailController = require('../controllers/detailController');

detailRoutes.get('/size', detailController.getSize);
detailRoutes.get('/color', detailController.getColor);
detailRoutes.put('/update-detail/:id', detailController.updateProductDetail);
detailRoutes.get('/product-stock/:productId', detailController.getProductStock);

module.exports = detailRoutes;