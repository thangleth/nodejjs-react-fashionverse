// api thống kê
const { Product, ProductDetail, Size, Color, ProductImage } = require('../models');
const { Sequelize } = require('sequelize');
const { Op } = require('sequelize');

const productController = {
    // Lấy danh sách sản phẩm
    async getAllProduct(req, res) {
        try {
            const products = await Product.findAll({
                include: [
                    {
                        model: ProductDetail, as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: "productImage" },
                        ]
                    }
                ]
            });
            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách sản phẩm: ${error.message}` });
        }
    },

    // Lấy danh sách sản phẩm theo ID
    async getProductById(req, res) {
        const productId = req.params.id; // Lấy ID từ tham số URL
        try {
            const product = await Product.findOne({
                where: { product_id: productId },
                include: [
                    {
                        model: ProductDetail, as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: 'productImage' }
                        ]
                    }
                ]
            });

            if (!product) {
                return res.status(404).json({ message: 'Sản phẩm không tìm thấy' });
            }

            res.status(200).json(product);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy sản phẩm: ${error.message}` });
        }
    },

    // Lấy danh sách sản phẩm phổ biến
    async getFeaturedProducts(req, res) {
        try {
            const products = await Product.findAll({
                include: [
                    {
                        model: ProductDetail, as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: 'productImage' }
                        ],
                        where: {
                            isFeatured: 1
                        }
                    }
                ],

            });
            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách sản phẩm nổi bật: ${error.message}` });
        }
    },
    // Lấy danh sách sản phẩm mới
    async getNewProducts(req, res) {
        try {
            const products = await Product.findAll({
                include: [
                    {
                        model: ProductDetail, as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: 'productImage' }
                        ]
                    }
                ],
                order: [['product_id', 'DESC']],
                limit: 6
            });
            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách sản phẩm mới: ${error.message}` }); // Update error message
        }
    },
    // Lấy danh sách sản phẩm giảm giá
    async getDiscountedProducts(req, res) {
        try {
            const products = await Product.findAll({
                where: {
                    price_promotion: { [Sequelize.Op.ne]: 0 }
                },
                include: [
                    {
                        model: ProductDetail, as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: 'productImage' }
                        ],
                    }
                ],
            });
            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách sản phẩm giảm giá: ${error.message}` });
        }
    },
    // Lấy danh sách sản phẩm theo danh mục
    async getProductbyCategory(req, res) {
        const categoryID = req.params.categoryID;
        try {
            const products = await Product.findAll({
                where: { category_id: categoryID },
                include: [
                    {
                        model: ProductDetail, as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: 'productImage' }
                        ]
                    }
                ]
            });

            if (products.length === 0) {
                return res.status(404).json({ message: 'Không tìm thấy sản phẩm trong danh mục này' });
            }

            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy sản phẩm theo danh mục: ${error.message}` });
        }
    },
    async getProductByParentID(req, res) {
        const { parentId } = req.params;

        try {
            if (!parentId) {
                return res.status(400).json({ message: 'Parent ID không được để trống' });
            }
            const products = await Product.findAll({
                where: {
                    category_id: {
                        [Op.like]: `${parentId}%` // Product IDs starting with parentId
                    }
                },
                include: [
                    {
                        model: ProductDetail,
                        as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: 'productImage' }
                        ]
                    }
                ]
            });

            if (!products || products.length === 0) {
                return res.status(404).json({ message: 'Không tìm thấy sản phẩm với Parent ID này' });
            }

            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy sản phẩm theo Parent ID: ${error.message}` });
        }
    },
    // Thêm sản phẩm
    async addProduct(req, res) {
        const { product_name, price, category_id, price_promotion } = req.body;

        try {
            const newProduct = await Product.create({
                product_name,
                price,
                price_promotion: price_promotion || 0,
                category_id,
            });

            res.status(201).json({
                message: 'Thêm sản phẩm thành công',
                newProduct
            });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi thêm sản phẩm: ${error.message}` });
        }
    },
    // Ẩn sản phẩm
    async hideProduct(req, res) {
        const { id } = req.params;
        console.log('Product ID:', id);
        try {
            const product = await Product.findByPk(id);
            console.log(product);

            if (!product) {
                return res.status(404).json({ message: 'Sản phẩm không tồn tại' });
            }

            product.is_hidden = true;
            await product.save();

            res.status(200).json({ message: 'Sản phẩm đã được ẩn thành công', product });
        } catch (error) {
            console.error('Lỗi khi ẩn sản phẩm:', error);
            res.status(500).json({ message: 'Có lỗi xảy ra khi ẩn sản phẩm' });
        }
    },
    // Hiện sản phẩm
    async showProduct(req, res) {
        const { id } = req.params;
        console.log('Product ID:', id);
        try {
            const product = await Product.findByPk(id);
            console.log(product);

            if (!product) {
                return res.status(404).json({ message: 'Sản phẩm không tồn tại' });
            }

            product.is_hidden = false;
            await product.save();

            res.status(200).json({ message: 'Sản phẩm đã được hiển thị thành công', product });
        } catch (error) {
            console.error('Lỗi khi hiển thị sản phẩm:', error);
            res.status(500).json({ message: 'Có lỗi xảy ra khi hiển thị sản phẩm' });
        }
    },
    // Cập nhật sản phẩm
    async updateProduct(req, res) {
        const { id } = req.params;
        const { product_name, price, price_promotion, category_id } = req.body;

        try {
            // Fetch product by ID
            const product = await Product.findByPk(id);

            if (!product) {
                return res.status(404).json({ message: 'Không tìm thấy sản phẩm để cập nhật' });
            }

            // Update product fields
            await product.update({ product_name, price, price_promotion, category_id });

            // Respond with success
            res.status(200).json({ message: 'Cập nhật sản phẩm thành công', product });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi cập nhật sản phẩm: ${error.message}` });
        }
    },
    // Tìm kiếm sản phẩm theo tên
    async searchProductByName(req, res) {
        const { name } = req.query; // Lấy từ query parameter

        try {
            if (!name) {
                return res.status(400).json({ message: 'Vui lòng cung cấp tên sản phẩm để tìm kiếm' });
            }

            const products = await Product.findAll({
                where: {
                    product_name: {
                        [Op.like]: `%${name}%` // Tìm kiếm tên sản phẩm có chứa chuỗi này
                    }
                },
                include: [
                    {
                        model: ProductDetail,
                        as: 'detail',
                        include: [
                            { model: Color, as: 'color' },
                            { model: Size, as: 'size' },
                            { model: ProductImage, as: 'productImage' }
                        ]
                    }
                ]
            });

            if (products.length === 0) {
                return res.status(404).json({ message: 'Không tìm thấy sản phẩm phù hợp' });
            }

            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi tìm kiếm sản phẩm: ${error.message}` });
        }
    },
    async countTotalProducts(req, res) {
        try {
            // Sử dụng Sequelize để đếm số lượng sản phẩm
            const totalCount = await Product.count();

            // Trả về tổng số lượng sản phẩm
            res.status(200).json({ totalProducts: totalCount });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi tính tổng số lượng sản phẩm: ${error.message}` });
        }
    },
    async countTotalProducts(req, res) {
        try {
            // Sử dụng Sequelize để đếm số lượng sản phẩm
            const totalCount = await Product.count();
    
            // Trả về tổng số lượng sản phẩm
            res.status(200).json({ totalProducts: totalCount });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi tính tổng số lượng sản phẩm: ${error.message}` });
        }
    },
     async getDiscountedProducts(req, res) {
        try {
            const products = await Product.findAll({
                where: {
                    price_promotion: { [Sequelize.Op.ne]: 0 } // Chỉ lấy các sản phẩm có giá khuyến mãi khác 0
                },
                include: [
                    {
                        model: ProductDetail, as: 'detail',
                        include: [
                            { model: Size, as: 'size' },
                            { model: Color, as: 'color' },
                            { model: ProductImage, as: 'productImage' }
                        ],
                    }
                ],
            });
            res.status(200).json(products);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách sản phẩm giảm giá: ${error.message}` });
        }
    },

}

module.exports = productController;