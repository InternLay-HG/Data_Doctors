const userModel = require("../models/user");
const bcrypt = require("bcrypt")
const jwt = require('jsonwebtoken');

async function login(req, res) {
	let { email , password } = req.body;
	let user = await userModel.findOne({email});
	if(!user) {
		return res.status(400).send({
			status: "failure",
			message: "Invalid credentials"
		});
	}
   
	bcrypt.compare(password , user.password , function(err,result) {
		if(result) {
			let token = jwt.sign({email : email , userid : user._id} , process.env.JWT_SECRET);
			res.status(200).send({
				status: "success",
				message: "Logged in successfully",
				token: token
			});
		} else {
			return res.status(400).send({
				status: "failure",
				message: "Invalid credentials"
			});
	   	}
	})
}

module.exports = {
	login
}
