const authRoutes = require('./authRoutes');
const userRoutes = require('./userRoutes');
const productRoutes = require('./productRoutes');
const categoryRoutes = require('./categoryRoutes');
const cartRoutes = require('./cartRoutes');
const detailRoutes = require('./detailRoutes')
const reviewRoutes = require('./reviewRoutes')
const orderRoutes = require('./orderRoutes')
const cityRoutes = require('./cityRoutes')
const paymentRoutes = require('./paymentRoutes.js');
const router = require('./favoriteRoutes.js');
const voucherRoutes = require('./voucherRoutes');
const newsRoutes = require('./newsRoutes');
const routes = require('express').Router();

routes.use('/auth', authRoutes);
routes.use('/user', userRoutes);
routes.use('/product', productRoutes);
routes.use('/category', categoryRoutes);
routes.use('/cart', cartRoutes);
routes.use('/detail', detailRoutes);
routes.use('/orders', orderRoutes);
routes.use('/review', reviewRoutes);
routes.use('/cities', cityRoutes);
routes.use('/payment', paymentRoutes);
routes.use('/favorite', router);
routes.use('/vouchers', voucherRoutes); 
routes.use('/news', newsRoutes);




module.exports = routes;