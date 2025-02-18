// api thống kê khóa username
const { User } = require('../models');
const path = require('path');
const fs = require('fs');

const userController = {
    // Lấy tất cả người dùng
    async getAllUser(req, res) {
        try {
            const users = await User.findAll();
            res.status(200).json(users);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách người dùng: ${error.message}` });
        }
    },

    // Lấy thông tin người dùng theo ID
    async getUserbyId(req, res) {
        try {
            const user = await User.findByPk(req.params.id, {
                attributes: { exclude: ['password'] }
            });
            if (!user) {
                return res.status(404).json({ message: 'Người dùng không tồn tại' });
            } else {
                res.status(200).json(user);
            }
        } catch (error) {
            res.status(400).json({ message: `Lỗi khi lấy thông tin người dùng: ${error.message}` });
        }
    },

    // Thêm người dùng mới
    async createUser(req, res) {
        try {
            const { name, email, password, is_locked } = req.body;

            // Kiểm tra dữ liệu đầu vào
            if (!name || !email || !password) {
                return res.status(400).json({ message: 'Thông tin không đầy đủ' });
            }

            const newUser = await User.create({ name, email, password, is_locked: is_locked || false });
            res.status(201).json(newUser);
        } catch (error) {
            console.error(`Error creating user: ${error.message}`);
            res.status(500).json({ message: `Lỗi khi thêm người dùng: ${error.message}` });
        }
    },

    // Sửa thông tin người dùng
    async updateUser(req, res) {
        try {
            const { id } = req.params;

            if (!id) {
                return res.status(400).json({ message: 'user_id is required' });
            }

            const { name, email, phone, address } = req.body;

            const user = await User.findByPk(id);
            if (!user) {
                return res.status(404).json({ message: 'Người dùng không tồn tại' });
            }
            let avatar = user.avatar;

            if (req.file) {
                const avatarPath = path.join(__dirname, '../public/avatar', user.avatar);

                if (user.avatar && user.avatar !== 'default-avatar.jpg' && fs.existsSync(avatarPath)) {
                    fs.unlinkSync(avatarPath);
                }

                avatar = req.file.filename;
            }

            await user.update({ name, email, phone, address, avatar });
            res.status(200).json(user);
        } catch (error) {
            console.error(`Error updating user: ${error.message}`);
            res.status(500).json({ message: `Lỗi khi sửa người dùng: ${error.message}` });
        }
    },
    // Đếm tổng số người dùng
    async getTotalUsers(req, res) {
        try {
            const totalUsers = await User.count();
            res.status(200).json({ totalUsers });
        } catch (error) {
            console.error(`Error counting users: ${error.message}`);
            res.status(500).json({ message: `Lỗi khi đếm người dùng: ${error.message}` });
        }
    },

    // Khóa/mở khóa người dùng
    async toggleLock(req, res) {
        try {
            const { id } = req.params; // Lấy user_id từ URL
            const { is_locked } = req.body; // Trạng thái khóa mới

            const user = await User.findByPk(id);
            if (!user) {
                return res.status(404).json({ message: 'Người dùng không tồn tại' });
            }

            // Kiểm tra xem người dùng có phải là admin không
            if (user.role === 'admin') {
                return res.status(403).json({ message: 'Không thể khóa/mở khóa tài khoản admin' });
            }

            // Cập nhật trạng thái khóa/mở khóa
            user.is_locked = is_locked;
            await user.save();

            res.status(200).json({ message: `Người dùng đã được ${is_locked ? 'khóa' : 'mở khóa'} thành công.` });
        } catch (error) {
            console.error(`Error updating user status: ${error.message}`);
            res.status(500).json({ message: `Lỗi khi cập nhật trạng thái người dùng: ${error.message}` });
        }
    },
};

module.exports = userController;
