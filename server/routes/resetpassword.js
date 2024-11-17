require('dotenv').config()
const nodemailer = require('nodemailer')
const otpModel = require('../models/otp')
const userModel = require("../models/user")
const bcrypt = require("bcrypt")

function isStrongPassword(password) {
	const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$/;
	return strongPasswordRegex.test(password);
}

async function resetpassword(req, res) {
    
    if(req.body.stage === "verifyownership") {
        try {
            const {stage, email} = req.body;

            let user = await userModel.findOne({email})
            if(!user) {
                return res.send({
                    "status": "failure",
                    "rescode": 1011,
                    "message": "Provided email is not registered"
                })
            }

            const otp = Math.floor(100000 + Math.random() * 900000).toString();

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
        
            transporter.sendMail(mailOptions);

            await otpModel.findOneAndUpdate({email}, {
                email,
                otp
            }, {
                upsert: true
            })

            return res.send({
                "status": "sucess",
                "rescode": 1010,
                "message": "OTP has been sent to email"
            })
        } catch(err) {
            console.log(err)
            res.send({
                "status": "failure",
                "rescode": 1012,
                "message": "Unknown server error, please try again later"
            })
        }

    } else if (req.body.stage === "password-reset") {
        try {
            const {stage, email, otp, newpassword} = req.body
            console.log(req.body)
            const record = await otpModel.findOne({email})
            if(!record || record.otp !== otp) {
                console.log(`DEBUG: ${record}`)
                return res.send({
                    "status": "failure",
                    "rescode": 1014,
                    "message": "Invalid or expired OTP"
                })
            }
            if(!isStrongPassword(newpassword)) {
                return res.send({
                    "status": "failure",
                    "rescode": 1015,
                    "message": "Password is too weak"
                })
            }

            const hashedPassword = await bcrypt.hash(newpassword, 10);
            await userModel.findOneAndUpdate({email}, {
                password: hashedPassword
            }, {
                upsert: true
            })
            return res.send({
                status: "success",
                rescode: 1013,
                message: "Password Changed Successfully"
            })
        } catch(err) {
            console.log(err)
            return res.send({
                "status": "failure",
                "rescode": 1016,
                "message": "Unknown server error, please try again later"
            })
        }
    }
}

module.exports = {
    resetpassword
}