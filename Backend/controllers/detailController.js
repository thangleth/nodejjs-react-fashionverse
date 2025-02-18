const { Product, ProductDetail, Size, Color, ProductImage } = require('../models');

const detailController = {
    async getSize(req, res) {
        try {
            const sizes = await Size.findAll();
            res.status(200).json(sizes);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách kích cỡ: ${error.message}` });
        }
    },
    async getColor(req, res) {
        try {
            const colors = await Color.findAll();
            res.status(200).json(colors);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách màu: ${error.message}` });
        }
    },
    async updateProductDetail(req, res) {
        try {
            const { id } = req.params; // Lấy ID chi tiết sản phẩm từ URL
            const {
                size_id,
                color_id,
                quantity,
                description,
                isFeatured,
                isHot,
                is_primary,
                is_hidden,
            } = req.body; // Lấy dữ liệu từ body của yêu cầu

            // Kiểm tra xem chi tiết sản phẩm có tồn tại không
            const productDetail = await ProductDetail.findByPk(id);
            if (!productDetail) {
                return res.status(404).json({ message: 'Chi tiết sản phẩm không tồn tại' });
            }

            // Cập nhật chi tiết sản phẩm
            await productDetail.update({
                size_id,
                color_id,
                quantity,
                description,
                isFeatured,
                isHot,
                is_primary,
                is_hidden,
            });

            res.status(200).json({
                message: 'Cập nhật chi tiết sản phẩm thành công',
                data: productDetail,
            });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi cập nhật chi tiết sản phẩm: ${error.message}` });
        }
    },
    async getProductStock(req, res) {
        try {
            const { productId } = req.params; // Lấy ID sản phẩm từ URL

            // Lấy thông tin tồn kho của sản phẩm
            const productDetails = await ProductDetail.findAll({
                where: { product_id: productId },
                attributes: ['size_id', 'color_id', 'quantity'],
                include: [
                    { model: Size, as: 'Size', attributes: ['name'] }, // Sử dụng alias 'Size'
                    { model: Color, as: 'Color', attributes: ['name'] } // Sử dụng alias 'Color'
                ]
            });

            if (!productDetails || productDetails.length === 0) {
                return res.status(404).json({ message: 'Không tìm thấy thông tin tồn kho cho sản phẩm này' });
            }

            res.status(200).json({
                message: 'Lấy thông tin tồn kho thành công',
                data: productDetails,
            });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy thông tin tồn kho: ${error.message}` });
        }
    },
};

module.exports = detailController;
