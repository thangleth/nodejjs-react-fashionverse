const jwt = require('jsonwebtoken');
require('dotenv').config();

const authenticateToken = (req, res, next) => {
    const token = req.cookies.token || req.headers['authorization']?.split(' ')[1]; // Kiểm tra cả cookie và header
  
    if (!token) {
      return res.status(401).json({ message: 'Token không tồn tại' });
    }
  
    jwt.verify(token, process.env.JWT_SECRET, (err, decoded) => {
      if (err) {
        console.error("JWT verification error:", err); // Log chi tiết lỗi
        return res.status(403).json({ message: 'Token không hợp lệ hoặc không tồn tại' });
      }
      req.user = decoded; // Lưu thông tin người dùng vào req.user
      next();
    });
  };
  


module.exports = authenticateToken;


