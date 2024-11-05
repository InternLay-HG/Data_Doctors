const { register } = require("./register.js")
const { login } = require("./login.js")
const { verifyotp } = require("./verifyotp.js")

module.exports = {
	register,
	login,
	verifyotp,
}
