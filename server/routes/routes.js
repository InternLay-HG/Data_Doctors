const { register } = require("./register.js")
const { login } = require("./login.js")
const { verifyotp } = require("./verifyotp.js")
const { resetpassword } = require("./resetpassword")

module.exports = {
	register,
	login,
	verifyotp,
	resetpassword
}
