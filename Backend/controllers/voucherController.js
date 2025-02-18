const { Voucher } = require('../models');
const { Sequelize } = require('sequelize');

const voucherController = {
    async getAllVouchers(req, res) {
        try {
            const vouchers = await Voucher.findAll();
            res.status(200).json(vouchers);
        } catch (error) {
            console.error(`Error fetching vouchers: ${error.message}`);
            res.status(500).json({ message: `Lỗi khi lấy danh sách voucher: ${error.message}` });
        }
    },
    async applyVoucher(req, res) {
        const { code } = req.body;
        try {
            // Tìm voucher trong cơ sở dữ liệu
            const voucher = await Voucher.findOne({
                where: {
                    code,
                    expiration_date: {
                        [Sequelize.Op.gt]: new Date() // Kiểm tra xem voucher có chưa hết hạn không
                    },
                }
            });
    
            if (voucher) {
                // Nếu tìm thấy voucher hợp lệ
                res.json({
                    discount: voucher.discount_amount, // Trả về số tiền giảm giá
                    message: 'Voucher applied successfully' // Thông báo thành công
                });
            } else {
                // Nếu không tìm thấy voucher hợp lệ hoặc hết hạn
                res.status(400).json({ error: 'Invalid or expired voucher' });
            }
        } catch (error) {
            // Xử lý lỗi nếu có
            res.status(500).json({ error: error.message });
        }
    },    
    async createVoucher(req, res) {
        try {
            const { code, discount_amount, expiration_date } = req.body;

            if (!code || !discount_amount || !expiration_date) {
                return res.status(400).json({ message: 'Thông tin không đầy đủ' });
            }

            const newVoucher = await Voucher.create({
                code,
                discount_amount,
                expiration_date,
            });

            res.status(201).json(newVoucher);
        } catch (error) {
            console.error(`Error creating voucher: ${error.message}`);
            res.status(500).json({ message: `Lỗi khi thêm voucher: ${error.message}` });
        }
    },
    async deleteVoucher(req, res) {
        try {
            const deletedCount = await Voucher.destroy({
                where: {},  // No condition means all vouchers will be deleted
            });
    
            if (deletedCount === 0) {
                return res.status(404).json({ message: 'Không có voucher nào để xóa' });
            }
    
            res.status(200).json({ message: 'Tất cả voucher đã được xóa thành công' });
        } catch (error) {
            console.error(`Error deleting vouchers: ${error.message}`);
            res.status(500).json({ message: `Lỗi khi xóa voucher: ${error.message}` });
        }
    }
    
};

module.exports = voucherController;