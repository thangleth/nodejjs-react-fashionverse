const { News } = require('../models');

const newsController = {
    // Lấy danh sách tin tức
    async getAllNews(req, res) {
        try {
            const news = await News.findAll();
            res.status(200).json(news);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy danh sách tin tức: ${error.message}` });
        }
    },

    // Lấy tin tức theo ID
    async getNewsByID(req, res) {
        try {
            const { id } = req.params;
            const news = await News.findByPk(id);

            if (!news) {
                return res.status(404).json({ message: 'Tin tức không tồn tại' });
            }

            res.status(200).json(news);
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi lấy tin tức: ${error.message}` });
        }
    },

    // Thêm tin tức
    async addNews(req, res) {
        try {
            const { title_news, summary, content, image_news, status, author } = req.body;
            if (!title_news || !summary || !content || !author) {
                return res.status(400).json({ message: 'Tiêu đề, tóm tắt, nội dung và tác giả là bắt buộc' });
            }

            const newNews = await News.create({
                title_news,
                summary,
                content,
                image_news: image_news || null,
                status: status || 1, // Mặc định status là 1 (Hoạt động)
                author,
                views: 0, // Giả sử số lượt xem ban đầu là 0
                createdAt: new Date(),
                updatedAt: new Date(),
            });

            return res.status(201).json({
                message: 'Thêm tin tức thành công',
                news: newNews,
            });
        } catch (error) {
            console.log(error);
            res.status(500).json({ message: 'Có lỗi xảy ra khi thêm tin tức' });
        }
    },

    // Ẩn tin tức
    async hideNews(req, res) {
        const { id } = req.params;
        try {
            const news = await News.findByPk(id);

            if (!news) {
                return res.status(404).json({ message: 'Tin tức không tồn tại' });
            }

            news.status = 0; // Ẩn tin tức (status = 0)
            await news.save();

            res.status(200).json({ message: 'Tin tức đã được ẩn thành công', news });
        } catch (error) {
            console.error('Lỗi khi ẩn tin tức:', error);
            res.status(500).json({ message: 'Có lỗi xảy ra khi ẩn tin tức' });
        }
    },

    // Hiện tin tức
    async showNews(req, res) {
        const { id } = req.params;
        try {
            const news = await News.findByPk(id);

            if (!news) {
                return res.status(404).json({ message: 'Tin tức không tồn tại' });
            }

            news.status = 1; // Hiển thị tin tức (status = 1)
            await news.save();

            res.status(200).json({ message: 'Tin tức đã được hiển thị thành công', news });
        } catch (error) {
            console.error('Lỗi khi hiển thị tin tức:', error);
            res.status(500).json({ message: 'Có lỗi xảy ra khi hiển thị tin tức' });
        }
    },

    // Cập nhật tin tức
    async updateNews(req, res){
        const { id } = req.params;
        const { title_news, summary, content, image_news, status, author, views } = req.body;
        try{
            const news = await News.findByPk(id);
            if (!news){
                return res.status(404).json({ message: "Tin tức không tồn tại" });
            }
            if (title_news !== undefined) news.title_news = title_news;
            if (summary !== undefined) news.summary = summary;
            if (content !== undefined) news.content = content;
            if (image_news !== undefined) news.image_news = image_news;
            if (status !== undefined) news.status = status;
            if (author !== undefined) news.author = author;
            if (views !== undefined) news.views = views;
            news.updatedAt = new Date();
            await news.save();
            res.status(200).json({ message: "Tin tức đã được cập nhật thành công", news });
        }catch (error){
            console.log("Lỗi khi cập nhật tin tức:", error);
            res.status(500).json({ message: "Có lỗi xảy ra khi cập nhật tin tức" });
        }
    },

    // Đếm tổng số tin tức
    async countNews(req, res){
        try{
            const count = await News.count();
            res.status(200).json({ total: count });
        } catch (error) {
            res.status(500).json({ message: `Lỗi khi đếm tin tức: ${error.message}` });
        }
    },

   // Phương thức tăng lượt xem khi người dùng truy cập chi tiết bài viết
    async incrementViews(req, res){
        const { id } = req.params;
        try{
            const news = await News.findByPk(id);
            
            if (!news) {
                throw new Error('Tin tức không tồn tại');
            }

            news.views += 1;
            await news.save();
        }catch(error){
            console.error('Lỗi khi cập nhật lượt xem: ', error);
            throw error; // Để tuyến chính xử lý lỗi
        }
    }
};

module.exports = newsController;