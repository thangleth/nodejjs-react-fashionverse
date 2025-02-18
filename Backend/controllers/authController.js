// form validation đk,đn, quên mk
// cài zod npm install zod
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { User } = require('../models');
const nodemailer = require('nodemailer');
const crypto = require("crypto");
const { z } = require("zod");

const registerSchema = z.object({
  email: z.string()
    .email("Email không hợp lệ. Vui lòng nhập email đúng định dạng.")
    .nonempty("Email không được để trống."),
  password: z.string()
    .min(6, "Mật khẩu phải có ít nhất 6 ký tự.")
    .regex(/[A-Z]/, "Mật khẩu phải chứa ít nhất một chữ cái viết hoa.")
    .regex(/[a-z]/, "Mật khẩu phải chứa ít nhất một chữ cái thường.")
    .regex(/\d/, "Mật khẩu phải chứa ít nhất một chữ số.")
    .regex(/[@$!%*?&#]/, "Mật khẩu phải chứa ít nhất một ký tự đặc biệt.")
    .nonempty("Mật khẩu không được để trống."),
  name: z.string()
    .min(1, "Tên không được để trống.")
    .max(50, "Tên không được vượt quá 50 ký tự.")
    .nonempty("Tên không được để trống."),
  phone: z.string()
    .min(10, "Số điện thoại phải có ít nhất 10 số.")
    .max(15, "Số điện thoại không được vượt quá 15 số.")
    .regex(/^\d+$/, "Số điện thoại chỉ được chứa các ký tự số.")
    .nonempty("Số điện thoại không được để trống."),
  address: z.string()
    .min(5, "Địa chỉ phải có ít nhất 5 ký tự.")
    .max(100, "Địa chỉ không được vượt quá 100 ký tự.")
    .nonempty("Địa chỉ không được để trống."),
});
const confirmAccountSchema = z.object({
  email: z.string()
    .email("Email không hợp lệ. Vui lòng nhập email đúng định dạng."),
  token: z.string()
    .min(1, "Token không được để trống.")
});

  const checkTokenSchema = z.object({
    token: z.string().min(1, "Token không hợp lệ.")
});

const forgotPasswordSchema = z.object({
  email: z.string()
    .email("Email không hợp lệ. Vui lòng nhập email đúng định dạng.")
});


const resetPasswordSchema = z.object({
  email: z.string()
    .email("Email không hợp lệ. Vui lòng nhập email đúng định dạng."),
  token: z.string()
    .min(1, "Token không được để trống."),
  password: z.string()
    .min(6, "Mật khẩu phải có ít nhất 6 ký tự.")
    .regex(/[A-Z]/, "Mật khẩu phải chứa ít nhất một chữ cái viết hoa.")
    .regex(/[a-z]/, "Mật khẩu phải chứa ít nhất một chữ cái thường.")
    .regex(/\d/, "Mật khẩu phải chứa ít nhất một chữ số.")
    .regex(/[@$!%*?&#]/, "Mật khẩu phải chứa ít nhất một ký tự đặc biệt.")
});
const loginSchema = z.object({
  email: z.string()
    .email("Email không hợp lệ. Vui lòng nhập email đúng định dạng."),
  password: z.string()
    .min(6, "Mật khẩu phải có ít nhất 6 ký tự.")
});

const authController = {
    // Đăng ký
    async registerUser(req, res) {
        try {
          // Validate request body using Zod
          const validatedData = registerSchema.parse(req.body);
    
          // Destructure validated data
          const { email, password, name, phone, address } = validatedData;
    
          // Check if the user already exists
          const hashedPassword = await bcrypt.hash(password, 10);
          const confirmationToken = crypto.randomBytes(32).toString("hex");
    
          const [user, created] = await User.findOrCreate({
            where: { email },
            defaults: {
              email,
              password: hashedPassword,
              name,
              phone,
              address,
              confirmation_token: confirmationToken,
              is_confirmed: false,
            }
          });
    
          if (!created) {
            return res.status(400).json({ message: 'Email đã tồn tại' });
          }
    
          // Set up email transporter
          const transporter = nodemailer.createTransport({
            service: 'Gmail',
            auth: {
              user: process.env.EMAIL_USER,
              pass: process.env.EMAIL_PASS
            }
          });
    
          const mailOptions = {
            from: process.env.EMAIL_USER,
            to: email,
            subject: 'Xác nhận tài khoản Fashionverse',
            html: `<div style="font-family: Arial, sans-serif; line-height: 1.5; color: #333; background-color: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 10px; max-width: 600px; margin: auto;">
                        <h1 style="color: #0F3460; text-align: center; font-size: 24px;">Chào mừng bạn đến với FASHIONVERSE</h1>
                        <p style="font-size: 16px; text-align: center; margin-bottom: 20px;">
                            Nhấp vào liên kết dưới đây để xác nhận tài khoản của bạn:
                        </p>
                        <div style="text-align: center;">
                            <a href="http://localhost:8000/auth/confirm-account?email=${email}&token=${confirmationToken}" 
                            style="display: inline-block; padding: 10px 20px; color: #fff; background-color: #0F3460; text-decoration: none; border-radius: 5px; font-size: 16px;">
                                Xác nhận tài khoản
                            </a>
                        </div>
                        <p style="font-size: 14px; color: #777; text-align: center; margin-top: 20px;">
                            Nếu bạn không đăng ký tài khoản, vui lòng bỏ qua email này.
                        </p>
                    </div>`
          };
    
          // Send confirmation email
          transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
              console.error("Lỗi khi gửi email:", error);
              return res.status(500).json({ message: 'Không thể gửi email xác nhận' });
            } else {
              console.log("Email đã được gửi thành công:", info.response);
              const { password: _, ...userWithoutPassword } = user.dataValues;
              return res.status(201).json({ message: 'Đăng ký thành công', user: userWithoutPassword });
            }
          });
        } catch (error) {
          // If validation fails or any other error occurs, send a 400 response
          if (error instanceof z.ZodError) {
            return res.status(400).json({
              message: 'Dữ liệu không hợp lệ',
              errors: error.errors,
            });
          }
    
          // Catch any other errors
          res.status(500).json({ message: `Đã xảy ra lỗi trong quá trình đăng ký: ${error.message}` });
        }
      },
    async confirmAccount(req, res) {
        const { email, token } = req.query;
        console.log('Email:', email);
        console.log('Token:', token);
        // Kiểm tra tính hợp lệ của email và token
        if (!email || !token) {
            return res.status(400).json({ message: 'Thông tin không hợp lệ' });
        }

        try {
            // Tìm người dùng bằng email và token
            const user = await User.findOne({ where: { email, confirmation_token: token } });

            if (!user) {
                return res.status(400).json({ message: 'Liên kết xác nhận không hợp lệ hoặc đã hết hạn' });
            }

            // Cập nhật trạng thái xác nhận
            user.is_confirmed = true;
            user.confirmation_token = null; // Xóa token sau khi xác nhận
            await user.save();

            return res.status(200).json({ message: 'Tài khoản của bạn đã được xác nhận thành công' });
        } catch (error) {
            return res.status(500).json({ message: `Lỗi: ${error.message}` });
        }
    },
    // Đăng nhập
    async loginUser(req, res) {
        const { email, password } = req.body;
    
        // Validate input using Zod
        try {
          loginSchema.parse({ email, password });
        } catch (error) {
          if (error instanceof z.ZodError) {
            return res.status(400).json({
              message: 'Dữ liệu không hợp lệ',
              errors: error.errors,
            });
          }
        }
    
        if (!email || !password) {
          console.log("Thiếu email hoặc mật khẩu"); // Log kiểm tra đầu vào
          return res.status(400).json({ message: 'Email và mật khẩu không được để trống' });
        }
    
        try {
          // Find the user by email
          const user = await User.findOne({ where: { email } });
    
          // Check if user exists
          if (!user) {
            return res.status(400).json({ message: "Email không tồn tại" });
          }
    
          // Check if the account is locked
          if (user.is_locked) {
            return res.status(403).json({ message: "Tài khoản của bạn đã bị khóa. Vui lòng liên hệ hỗ trợ để được mở khóa." });
          }
    
          // Check if the email is confirmed
          if (!user.is_confirmed) {
            return res.status(403).json({ message: "Tài khoản của bạn chưa được xác nhận. Vui lòng kiểm tra email để xác nhận." });
          }
    
          // Check if the password matches
          const isPasswordMatch = await bcrypt.compare(password, user.password);
          if (!isPasswordMatch) {
            return res.status(400).json({ message: "Mật khẩu không đúng" });
          }
    
          // Generate JWT token
          const token = jwt.sign(
            { id: user.user_id, email: user.email, role: user.role },
            process.env.JWT_SECRET,
            { expiresIn: '1h' }
          );
    
          // Send the token to the client
          res.status(200).json({ token });
        } catch (error) {
          console.error(error);
          res.status(400).json({ message: `Lỗi đăng nhập: ${error.message}` });
        }
      },
      
      async checkToken(req, res, next) {
        const { token } = req.headers;

        // Validate token using Zod
        try {
            checkTokenSchema.parse({ token });
        } catch (error) {
            if (error instanceof z.ZodError) {
                return res.status(400).json({
                    message: 'Dữ liệu không hợp lệ',
                    errors: error.errors,
                });
            }
        }

        if (!token) {
            return res.status(401).json({ message: "Token không hợp lệ." });
        }

        try {
            jwt.verify(token, 'secret', (err, user) => {
                if (err) {
                    return res.status(401).json({ message: "Token không hợp lệ." });
                }
                req.user = user;
                res.status(200).json({
                    message: "Token hợp lệ.",
                    user: req.user,
                });
                // next();
            });
        } catch (err) {
            return res.status(500).json({ message: "Lỗi server khi xác thực token." });
        }
    },

    async forgotPassword(req, res) {
        const { email } = req.body;

        // Validate input using Zod
        try {
            forgotPasswordSchema.parse({ email });
        } catch (error) {
            if (error instanceof z.ZodError) {
                return res.status(400).json({
                    message: 'Dữ liệu không hợp lệ',
                    errors: error.errors,
                });
            }
        }

        if (!email) {
            return res.status(400).json({ message: 'Email không được để trống' });
        }

        try {
            const user = await User.findOne({ where: { email } });

            if (!user) {
                return res.status(404).json({ message: 'Email không tồn tại trong hệ thống' });
            }

            const resetToken = crypto.randomBytes(32).toString("hex");
            const resetTokenExpires = new Date(Date.now() + 3600000).toISOString();

            await user.update({
                reset_token: resetToken,
                reset_token_expires: resetTokenExpires
            });

            const transporter = nodemailer.createTransport({
                service: 'Gmail',
                auth: {
                    user: process.env.EMAIL_USER,
                    pass: process.env.EMAIL_PASS
                }
            });

            const mailOptions = {
                from: process.env.EMAIL_USER,
                to: email,
                subject: 'Yêu cầu đặt lại mật khẩu Fashionverse',
                html: `<div style="font-family: Arial, sans-serif; line-height: 1.5; color: #333; background-color: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 10px; max-width: 600px; margin: auto;">
                            <h1 style="color: #0F3460; text-align: center; font-size: 24px;">Đặt lại mật khẩu Fashionverse</h1>
                            <p style="font-size: 16px; text-align: center; margin-bottom: 20px;">
                                Nhấp vào liên kết dưới đây để đặt lại mật khẩu của bạn:
                            </p>
                            <div style="text-align: center;">
                                <a href="http://localhost:5173/reset-password?email=${email}&token=${resetToken}" 
                                style="display: inline-block; padding: 10px 20px; color: #fff; background-color: #0F3460; text-decoration: none; border-radius: 5px; font-size: 16px;">
                                    Đặt lại mật khẩu
                                </a>
                            </div>
                            <p style="font-size: 14px; color: #777; text-align: center; margin-top: 20px;">
                                Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.
                            </p>
                        </div>`
            };

            console.log('Bắt đầu gửi email...');
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    console.error("Lỗi khi gửi email:", error);
                    return res.status(500).json({ message: 'Không thể gửi email đặt lại mật khẩu' });
                } else {
                    console.log("Email đặt lại mật khẩu đã được gửi thành công:", info.response);
                    return res.status(200).json({ message: 'Đã gửi email đặt lại mật khẩu' });
                }
            });
        } catch (error) {
            res.status(500).json({ message: `Đã xảy ra lỗi: ${error.message}` });
        }
    },

    async resetPassword(req, res) {
        const { email, token, password } = req.body;

        // Validate input using Zod
        try {
            resetPasswordSchema.parse({ email, token, password });
        } catch (error) {
            if (error instanceof z.ZodError) {
                return res.status(400).json({
                    message: 'Dữ liệu không hợp lệ',
                    errors: error.errors,
                });
            }
        }

        try {
            const user = await User.findOne({ where: { email, reset_token: token } });

            if (!user) {
                return res.status(400).json({ message: 'Yêu cầu đã hết hạn, vui lòng thử lại' });
            }

            if (user.reset_token_expires < new Date()) {
                return res.status(400).json({ message: 'Liên kết không hợp lệ hoặc đã hết hạn' });
            }

            const hashedPassword = await bcrypt.hash(password, 10);
            user.password = hashedPassword;
            user.reset_token = null;
            user.reset_token_expires = null;
            await user.save();

            res.status(200).json({ message: 'Đặt lại mật khẩu thành công' });
        } catch (error) {
            res.status(500).json({ message: `Lỗi: ${error.message}` });
        }
    }

}

module.exports = authController;

