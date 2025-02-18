
module.exports = (sequelize, DataTypes) => {
    const Voucher = sequelize.define('Voucher', {
        code: {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        },
        discount_amount: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        expiration_date: {
            type: DataTypes.DATE,
            allowNull: false
        },
    }, {
        tableName: 'vouchers',
        timestamps: false
    });
    return Voucher;
}
