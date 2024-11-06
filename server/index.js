// import express
const express = require("express")
const app = express()
const routes = require('./routes/routes.js')
const { logRequest } = require('./logger.js')

require('dotenv').config() // set up environment as per .env file (not tracked by git for security reasons)

// This object stores basig configuration
const config = {
	PORT: process.env.PORT
}

app.use(express.json()) // use application/json
app.set('trust proxy', true) // Trust proxies
// To be replaced to server frontend
// To be removed if frontend is served separately
app.get('/', async (req, res) => {
	res.status(200)
	res.set('Content-Type', 'text/html')
	res.send("<h1> It Works </h1>")
})

app.post('/register', async (req, res) => {
	logRequest(req)
	res.status(200)
	res.set('Content-Type', 'application/json')
	routes.register(req, res)
})

app.post('/verifyotp', async (req, res) => {
	logRequest(req)
	res.status(200)
	res.set('Content-Type', 'application/json')
	routes.verifyotp(req, res)
})

app.post('/login', async (req, res) => {
	logRequest(req)
	res.status(200)
	res.set('Content-Type', 'application/json')
	routes.login(req, res)
})

app.listen(config.PORT, () => {
	console.log(`Server is listening on port ${config.PORT}`)
})
