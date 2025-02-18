"use strict";

module.exports = (sequelize, DataTypes) => {
    const Favorite = sequelize.define(
        "Favorite",
        {
            favorite_id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
                allowNull: false,
            },
            user_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "users", // Đảm bảo bảng 'users' có trường 'user_id' làm khóa chính
                    key: "user_id",
                },
                onDelete: "CASCADE", // Xóa yêu thích khi người dùng bị xóa
            },
            product_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "products", // Đảm bảo bảng 'products' có trường 'product_id' làm khóa chính
                    key: "product_id",
                },
                onDelete: "CASCADE", // Xóa yêu thích khi sản phẩm bị xóa
            },
        },
        {
            tableName: "favorite", // Đảm bảo tên bảng khớp với bảng trong DB
            timestamps: false, // Đặt thành true nếu muốn Sequelize quản lý trường createdAt và updatedAt
        }
    );

    // Định nghĩa mối quan hệ với bảng Product, ProductDetail và ProductImage
    Favorite.associate = function (models) {
        // Mối quan hệ với Product
        Favorite.belongsTo(models.Product, {
            foreignKey: "product_id",
            as: "product", // Alias cho mối quan hệ này
            include: [
                {
                    model: models.ProductDetail, // Liên kết với ProductDetail
                    as: "detail", // Alias cho mối quan hệ ProductDetail
                    include: [
                        {
                            model: models.ProductImage, // Liên kết với ProductImage
                            as: "productImage", // Alias cho mối quan hệ ProductImage
                            where: { is_primary: 1 }, // Lọc ra ảnh chính
                            attributes: ['img_url'], // Lấy trường img_url của ảnh sản phẩm
                        },
                    ],
                },
            ],
        });

        // Mối quan hệ với User (nếu có)
        Favorite.belongsTo(models.User, {
            foreignKey: "user_id",
            as: "user", // Alias cho mối quan hệ này
        });
    };

    return Favorite;
};
