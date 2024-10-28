async function logRequest(req) {
	let datetime = new Date()
	console.log(`[${datetime}] : ${req.ip}`)
	console.log(req.body)
	console.log('\n')
}

module.exports = {
	logRequest
}
