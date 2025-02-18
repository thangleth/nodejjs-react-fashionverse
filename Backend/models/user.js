"use strict";

module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define(
        "User",
        {
            user_id: {
                type: DataTypes.BIGINT.UNSIGNED,
                autoIncrement: true,
                primaryKey: true,
            },
            name: {
                type: DataTypes.STRING(255),
                allowNull: true,
            },
            email: {
                type: DataTypes.STRING(255),
                allowNull: false,
                unique: true,
            },
            password: {
                type: DataTypes.STRING(255),
                allowNull: false,
            },
            role: {
                type: DataTypes.TINYINT,
                defaultValue: 0,
                allowNull: false,
            },
            phone: {
                type: DataTypes.STRING(255),
                allowNull: true,
            },
            address: {
                type: DataTypes.STRING(255),
                allowNull: true,
            },
            avatar: {
                type: DataTypes.STRING(255),
                allowNull: true,
            },
            registration_date: {
                type: DataTypes.DATE,
                allowNull: true,
                defaultValue: DataTypes.NOW,
            },
            confirmation_token: {
                type: DataTypes.STRING,
            },
            is_confirmed: {
                type: DataTypes.BOOLEAN,
                defaultValue: false,
            },
            reset_token: {
                type: DataTypes.STRING,
                allowNull: true,
            },
            reset_token_expires: {
                type: DataTypes.STRING,
                allowNull: true,
            },
            is_locked: {
                type: DataTypes.BOOLEAN,
                defaultValue: false,
                allowNull: false,
            },
            // Thêm trường voucher_id vào model User
            voucher_id: {
                type: DataTypes.INTEGER,
                allowNull: true,
                references: {
                    model: "voucher", // Tên bảng Voucher
                    key: "voucher_id", // Tên khóa chính trong bảng Voucher
                },
                onDelete: "SET NULL", // Khi voucher bị xóa, voucher_id sẽ được đặt lại là NULL
            },
        },
        {
            tableName: "user",
            timestamps: false, // Giữ lại false nếu bạn không muốn Sequelize tự động thêm createdAt/updatedAt
        }
    );

    User.associate = (models) => {
        User.hasMany(models.Order, {
            foreignKey: 'user_id',
            as: 'orders',
        });

        // Quan hệ giữa User và Voucher
        User.belongsTo(models.Voucher, {
            foreignKey: "voucher_id", // Khoá ngoại trong bảng User
            as: "voucher", // Alias cho mối quan hệ
        });
    };

    return User;
};
