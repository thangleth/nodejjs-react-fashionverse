const voucherRoutes = require('express').Router();
const voucherController = require('../controllers/voucherController');

voucherRoutes.get('/', voucherController.getAllVouchers)
voucherRoutes.delete('/:id', voucherController.deleteVoucher)
voucherRoutes.post('/vouchers/add', voucherController.createVoucher);
voucherRoutes.post('/apply', voucherController.applyVoucher);



module.exports = voucherRoutes;