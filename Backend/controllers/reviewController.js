const { Review, ProductDetail, User } = require('../models'); // Điều chỉnh đường dẫn nếu cần thiết

const reviewController = {
    // Tạo mới review
    async createReview(req, res) {
        const { content, date, user_id, product_detail_id } = req.body;

        if (!content || !date || !user_id || !product_detail_id) {
            return res.status(400).json({ message: 'Tất cả các trường đều bắt buộc' });
        }

        try {
            const productDetail = await ProductDetail.findByPk(product_detail_id);
            if (!productDetail) {
                return res.status(404).json({ message: 'Không tìm thấy chi tiết sản phẩm' });
            }

            const newReview = await Review.create({ content, date, user_id, product_detail_id });
            res.status(201).json({ message: 'Tạo review thành công', review: newReview });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi tạo review: ${error.message}` });
        }
    },

    // Lấy tất cả các review với thông tin chi tiết về người dùng và sản phẩm
    async getAllReviews(req, res) {
        try {
            const reviews = await Review.findAll({
                include: [
                    {
                        model: ProductDetail,
                        as: 'productDetail',
                        attributes: ['product_detail_id', 'product_id'], // Lấy thông tin sản phẩm liên quan
                    },
                    {
                        model: User,
                        as: 'user',
                        attributes: ['user_id', 'name', 'email'], // Lấy thông tin người dùng liên quan
                    },
                ],
            });

            if (reviews.length === 0) {
                return res.status(404).json({ message: 'Không có bình luận nào' });
            }

            res.status(200).json(reviews); // Trả về danh sách bình luận
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách review: ${error.message}` });
        }
    },

    // Lấy thông tin chi tiết review theo ID sản phẩm
    async getReviewById(req, res) {
        const { id } = req.params;
        try {
            const reviews = await Review.findAll({
                where: {
                    product_detail_id: id, // Lọc theo product_detail_id
                },
                include: [
                    {
                        model: User, 
                        as: 'user',
                        attributes: ['user_id', 'name', 'email', 'avatar'], // Thông tin người dùng
                    },
                ],
            });

            if (!reviews || reviews.length === 0) {
                return res.status(404).json({ message: 'Không tìm thấy review' });
            }

            res.status(200).json(reviews); // Trả về danh sách review của sản phẩm chi tiết
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy thông tin review: ${error.message}` });
        }
    },

    // Cập nhật review
    async updateReview(req, res) {
        const { id } = req.params;
        const { content, date } = req.body;

        try {
            const review = await Review.findByPk(id);
            if (!review) {
                return res.status(404).json({ message: 'Không tìm thấy review' });
            }

            review.content = content || review.content;
            review.date = date || review.date;
            await review.save();

            res.status(200).json({ message: 'Cập nhật review thành công', review });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi cập nhật review: ${error.message}` });
        }
    },

    // Xóa review bên useruser
    async deleteReview(req, res) {
        try {
            const reviewId = parseInt(req.params.id, 10);

            if (isNaN(reviewId)) {
                return res.status(400).json({ message: 'ID bình luận không hợp lệ' });
            }

            const review = await Review.findByPk(reviewId);

            if (!review) {
                return res.status(404).json({ message: "Bình luận không tồn tại" });
            }

            if (review.user_id !== req.user.id) {
                return res.status(403).json({ message: "Bạn không có quyền xóa bình luận này" });
            }

            await review.destroy();
            res.status(200).json({ message: "Bình luận đã được xóa thành công" });

        } catch (error) {
            res.status(500).json({ message: `Đã xảy ra lỗi khi xóa bình luận: ${error.message}` });
        }
    },

    //xóa review bên admin
    async cookReview(req, res) {
        try {
            const reviewId = parseInt(req.params.id, 10);

            if (isNaN(reviewId)) {
                return res.status(400).json({ message: 'ID bình luận không hợp lệ' });
            }

            const review = await Review.findByPk(reviewId);

            if (!review) {
                return res.status(404).json({ message: "Bình luận không tồn tại" });
            }

            // Nếu là admin, cho phép xóa
            await review.destroy();
            res.status(200).json({ message: "Bình luận đã được xóa thành công" });

        } catch (error) {
            res.status(500).json({ message: `Đã xảy ra lỗi khi xóa bình luận: ${error.message}` });
        }
    }

};

module.exports = reviewController;
