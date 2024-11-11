const userModel = require("../models/user");
const otpModel = require("../models/otp")
const bcrypt = require("bcrypt")
const nodemailer = require('nodemailer')

function isStrongPassword(password) {
	const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$/;
	return strongPasswordRegex.test(password);
}

async function sendOTPEmail(email, otp) {
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
		text: `Your OTP code is ${otp}. It will expire in 5 minutes.`
	};
  
	return transporter.sendMail(mailOptions);
}

async function register(req, res) {
	try {
		let { firstName, lastName, mobileNumber, email, password } = req.body;
	
		// Check for strong password
		if (!isStrongPassword(password)) {
		  return res.status(400).send({
            status: "success",
            message: "Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, one number, and one special character."
        });
		}
	
		// Check if user is already registered
		let user_email = await userModel.findOne({ email });
		if (user_email) {
		  return res.status(409).send({
            status: "failure",
            message: "Email already registered"
        });
		}
	
		let user_mobile = await userModel.findOne({ mobileNumber });
		if (user_mobile) {
		  return res.status(409).send({
            status: "failure",
            message: "Mobile Number Already in use"
        });
		}
	
		// Hash the password and create a new user
		const hashedPassword = await bcrypt.hash(password, 10);

		// Generate OTP
		const otp = Math.floor(100000 + Math.random() * 900000).toString();
	
		// send otp to email

		sendOTPEmail(email, otp);
		// Create user with hashed password
		const user = await otpModel.create({
		  firstName,
		  lastName,
		  mobileNumber,
		  email,
		  password: hashedPassword,
		  otp
		});
	
		return res.status(201).send({
            status: "success",
            message: "OTP has been sent to email, proceed with otp verification."
        });
	
	  } catch (error) {
		console.log(error)
		return res.status(500).send({
            status: "failure",
            message: "Unknown Server Error"
        });
	  }
}

module.exports = {
	register
}
