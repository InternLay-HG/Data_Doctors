const otpModel = require("../models/otp");
const userModel = require("../models/user");
const jwt = require('jsonwebtoken')

async function verifyOTP(email, inputOtp) {
    const otpRecord = await otpModel.findOne({ email, otp: inputOtp });
    if (!otpRecord) {
        throw new Error("Invalid or expired OTP");
    }

    // OTP is valid; delete it from the database
    return otpRecord;
}

async function verifyotp(req, res) {
	let {email, otp} = req.body

    try {
        const record = await verifyOTP(email, otp); // Assuming verifyOTP is a function that validates OTP

        // If not verified, error is thrown

        const user = await userModel.create({
            firstName: record.firstName,
            lastName: record.lastName,
            mobileNumber: record.mobileNumber,
            email,
            password: record.password,
            isHealthcareProvider: record.isHealthcareProvider
        })

        // Generate JWT token
		const token = jwt.sign({ email: email, userid: user._id }, process.env.JWT_SECRET);
	
        otpModel.deleteOne({ email }); // delete from temporary db
        return res.send({
            status: "success",
            rescode: 1006,
            message: "Account created successfully",
            token: token
        })

    } catch (error) {
        // If OTP verification fails, respond with an error message
        return res.send({
            status: "failure",
            rescode: 1007,
            message: "Invalid or expired OTP. Please try again."
        });
    }
}

module.exports = {
	verifyotp
}
