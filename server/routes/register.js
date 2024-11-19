const userModel = require("../models/user");
const otpModel = require("../models/otp")
const bcrypt = require("bcrypt")
const nodemailer = require('nodemailer')

function isStrongPassword(password) {
	const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$/;
	return strongPasswordRegex.test(password);
}

async function sendOTPEmail(email, otp , firstName) {
	const transporter = nodemailer.createTransport({
		service: process.env.EMAIL_SERVICE_PROVIDER, // or your email provider
		auth: {
			user: process.env.EMAIL_USER,
			pass: process.env.EMAIL_PASS
		}
	});
  
	const mailOptions = {
		from: process.env.EMAIL_USER,
		to: email,
		subject: 'Your OTP Code',
		html: `<div style="font-family: Arial, sans-serif; color: #333; padding: 20px; background-color: #f7f7f7; border-radius: 8px; max-width: 600px; margin: auto;">
  <h2 style="color: #28a745;">Welcome to Data Doctors!</h2>

  <p style="font-size: 16px; line-height: 1.6;">
    Dear ${firstName},
  </p>

  <p style="font-size: 16px; line-height: 1.6;">
    Thank you for registering with us. To complete your registration, please use the following One-Time Password (OTP) to verify your account:
  </p>

  <p style="font-size: 20px; font-weight: bold; color: #28a745; text-align: center; padding: 10px; border: 1px solid #28a745; border-radius: 5px;">
    YOUR OTP: ${otp}
  </p>

  <p style="font-size: 16px; line-height: 1.6;">
    This OTP is valid for the next 5 minutes. If you did not register with us, please ignore this email.
  </p>

  <p style="font-size: 16px; line-height: 1.6;">
    If you have any questions or need assistance, feel free to reach out to our support team.
  </p>

  <p style="font-size: 16px; line-height: 1.6; margin-top: 20px;">
    Welcome aboard!<br>
    <strong style="color: #28a745;">Data Doctors Support Team</strong>
  </p>
</div>`
	};
  
	return transporter.sendMail(mailOptions);
}

async function register(req, res) {
	try {
		let { firstName, lastName, mobileNumber, email, password, isHealthcareProvider } = req.body;
	
		// Check for strong password
		if (!isStrongPassword(password)) {
		  return res.send({
            status: "failure",
			rescode: 1002,
            message: "Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special character."
        });
		}
	
		// Check if user is already registered
		let user_email = await userModel.findOne({ email });
		if (user_email) {
		  return res.send({
            status: "failure",
			rescode: 1003,
            message: "Email already registered"
        });
		}
	
		let user_mobile = await userModel.findOne({ mobileNumber });
		if (user_mobile) {
		  return res.send({
            status: "failure",
			rescode: 1004,
            message: "Mobile Number Already in use"
        });
		}
	
		// Hash the password and create a new user
		const hashedPassword = await bcrypt.hash(password, 10);

		// Generate OTP
		const otp = Math.floor(100000 + Math.random() * 900000).toString();
	
		// send otp to email

		sendOTPEmail(email, otp, firstName);
		// Create user with hashed password
		const user = await otpModel.findOneAndUpdate(
			{
				email
			},
			{
			firstName,
			lastName,
			mobileNumber,
			email,
			password: hashedPassword,
			isHealthcareProvider,
			otp
			},
			{
				"upsert": true
			}
		);
	
		return res.send({
            status: "success",
			rescode: 1001,
            message: "OTP has been sent to email, proceed with otp verification."
        });
	
	  } catch (error) {
		console.log(error)
		return res.send({
            status: "failure",
			rescode: 1005,
            message: "Unknown Server Error"
        });
	  }
}

module.exports = {
	register
}
