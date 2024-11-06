const userModel = require("../models/user");
const bcrypt = require("bcrypt")
const jwt = require('jsonwebtoken');

async function login(req, res) {
	let { email , password } = req.body;
	let user = await userModel.findOne({email});
	if(!user) {
		return res.status(500).send("Invalid credentials");
	}
   
	bcrypt.compare(password , user.password , function(err,result) {
		if(result) {
			let token = jwt.sign({email : email , userid : user._id} , process.env.JWT_SECRET);
			res.cookie("token" , token);
			res.status(200).send("Logged in successfully");
		} else {
			return res.status(500).send("Invalid credentials");
	   	}
	})
}

module.exports = {
	login
}
