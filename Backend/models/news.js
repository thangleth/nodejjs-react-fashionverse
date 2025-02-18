"use strict";

module.exports = (sequelize, DataTypes) => {
    const News = sequelize.define(
        "News",
        {
            id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
                allowNull: false,
            },
            title_news: {
                type: DataTypes.STRING(1000),
                allowNull: false,
            },
            summary: {
                type: DataTypes.STRING(255),
                allowNull: false,
            },
            content: {
                type: DataTypes.TEXT,
                allowNull: false,
            },
            image_news: {
                type: DataTypes.STRING(255),
                allowNull: true, // Cho phép NULL nếu không bắt buộc
            },
            views: {
                type: DataTypes.INTEGER.UNSIGNED,
                allowNull: false,
                defaultValue: 0,
            },
            status: {
                type: DataTypes.TINYINT(1),
                allowNull: false,
                defaultValue: 1, // 1: Hoạt động, 0: Không hoạt động
            },
            createdAt: {
                type: DataTypes.DATE,
                allowNull: false,
                defaultValue: DataTypes.NOW,
            },
            updatedAt: {
                type: DataTypes.DATE,
                allowNull: false,
                defaultValue: DataTypes.NOW,
            },
            author: {
                type: DataTypes.STRING(255),
                allowNull: false,
            },
        },
        {
            tableName: "news",
            timestamps: true, // Tự động quản lý createdAt và updatedAt
        }
    );

    // Associations (nếu cần)
    News.associate = function (models) {
        // Ví dụ: Nếu bảng `news` có liên kết với bảng khác
        // News.belongsTo(models.Category, { foreignKey: 'category_id' });
    };

    return News;
};
