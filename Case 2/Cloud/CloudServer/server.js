const http = require('http');
const cloudServer = require("./cloudServer");

//Listening for the cloud client requests
const server = http.createServer(cloudServer);
const port = process.env.PORT || 3010;

server.listen(port);