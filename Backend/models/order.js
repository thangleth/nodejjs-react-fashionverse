"use strict";

module.exports = (sequelize, DataTypes) => {
    const Order = sequelize.define(
        "Order",
        {
            orders_id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
                allowNull: false,
            },
            code: {
                type: DataTypes.STRING(50),
                allowNull: false,
            },
            order_date: {
                type: DataTypes.DATE,
                allowNull: false,
                defaultValue: DataTypes.NOW,
            },
            total_price: {
                type: DataTypes.INTEGER,
                allowNull: false,
            },
            order_status: {
                type: DataTypes.ENUM(
                    "Chờ xử lý",
                    "Đã xác nhận",
                    "Đang giao",
                    "Đã giao",
                    "Đã hủy bởi cửa hàng",
                    "Đã hủy bởi khách hàng"),
                allowNull: false,
                defaultValue: "Chờ xử lý",
            },
            shipping_address: {
                type: DataTypes.STRING,
                allowNull: false,
            },
            user_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
            },
            payment_date: {
                type: DataTypes.DATE,
                allowNull: true,
            },
            payment_method: {
                type: DataTypes.STRING,
                allowNull: false,
            },
        },
        {
            tableName: "orders",
            timestamps: false,
        }
    );

    Order.associate = (models) => {
        Order.belongsTo(models.User, { foreignKey: "user_id", as: "user" });
        Order.hasMany(models.OrderDetail, { foreignKey: "orders_id", as: "orderDetail" });
    };

    return Order;
};
