"use strict";

module.exports = (sequelize, DataTypes) => {
    const Review = sequelize.define(
        "Review",
        {
            review_id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
                allowNull: false,
            },
            content: {
                type: DataTypes.TEXT,
                allowNull: false,
            },
            date: {
                type: DataTypes.DATE,
                allowNull: false,
            },
            user_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
            },
            product_detail_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "product_detail", // Tên bảng liên kết
                    key: "product_detail_id",
                },
            },
        },
        {
            tableName: "review",
            timestamps: false,
        }
    );

    Review.associate = function (models) {
        // Mối quan hệ giữa Review và ProductDetail
        Review.belongsTo(models.ProductDetail, {
            foreignKey: "product_detail_id",
            as: "productDetail",  // Alias dùng trong API
        });

        // Mối quan hệ giữa Review và User
        Review.belongsTo(models.User, {
            foreignKey: "user_id",
            as: "user",  // Alias dùng trong API
        });
    };

    return Review;
};
