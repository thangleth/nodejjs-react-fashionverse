const newsRoutes = require('express').Router();
const newsController = require('../controllers/newsController');

// Lấy danh sách tất cả bài viết
newsRoutes.get('/', newsController.getAllNews);

// Lấy bài viết theo ID và tăng lượt xem
newsRoutes.get('/:id', async (req, res) => {
    const { id } = req.params;
    
    try {
        // Tăng lượt xem trước khi lấy chi tiết bài viết
        await newsController.incrementViews(req, res);

        // Sau khi tăng lượt xem, trả về thông tin chi tiết bài viết
        // Đảm bảo chỉ gọi một lần res.json() hoặc res.send()
        return newsController.getNewsByID(req, res);
    } catch (error) {
        return res.status(500).json({ message: 'Error processing the request' });
    }
});

// Đếm tổng số bài viết
newsRoutes.get('/count', newsController.countNews);

// Thêm bài viết mới
newsRoutes.post('/add', newsController.addNews);

// Cập nhật thông tin bài viết
newsRoutes.put('/update/:id', newsController.updateNews);

// Ẩn bài viết
newsRoutes.patch('/hide/:id', newsController.hideNews);

// Hiển thị bài viết
newsRoutes.patch('/show/:id', newsController.showNews);

// Định nghĩa route để tăng lượt xem (được gọi trong /news/:id)
newsRoutes.patch('/increment-views/:id', async (req, res) => {
    try {
        console.log("Route được gọi với ID:", req.params.id);
        await newsController.incrementViews(req, res);
        return res.status(200).json({ message: 'Views incremented successfully' });
    } catch (error) {
        return res.status(500).json({ message: 'Error incrementing views' });
    }
});

module.exports = newsRoutes;
