require('dotenv').config()
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

mongoose.connect(process.env.DB_URI);

const otpSchema = new mongoose.Schema({
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    mobileNumber: { type: String, required: true, unique: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    otp: { type: String, required: true },
    createdAt: { type: Date, default: Date.now, expires: 300 } // OTP expires in 5 minutes
});

const OTP = mongoose.model('OTP', otpSchema);
module.exports = OTP