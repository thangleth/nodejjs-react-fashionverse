const { z } = require('zod');

const registerSchema = z.object({
    email: z.string().email({ message: 'Email không hợp lệ' }),
    password: z.string().min(6, { message: 'Mật khẩu phải có ít nhất 6 ký tự' }),
    name: z.string().min(1, { message: 'Tên không được để trống' }),
    phone: z.string().regex(/^\d{10,11}$/, { message: 'Số điện thoại không hợp lệ' }),
    address: z.string().min(1, { message: 'Địa chỉ không được để trống' }),
});

const loginSchema = z.object({
    email: z.string().email({ message: 'Email không hợp lệ' }),
    password: z.string().min(6, { message: 'Mật khẩu phải có ít nhất 6 ký tự' }),
});

module.exports = { registerSchema, loginSchema };
