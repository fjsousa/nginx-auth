var http = require('http');
var crypto = require('crypto');
http.createServer(function (req, res){

  var ttl = Date.now() + 3600 * 1000;
  var hash = crypto.createHmac('sha1', 'secret').update(ttl.toString()).digest('hex');
  res.writeHead(200, {
    'Set-Cookie': 'apptoken=' +  ttl + ':' + hash,
    'Content-Type': 'text/plain'
  });
  res.end('cookie set\n');
}).listen(8001);

console.log('Server running at http://localhost:8001');
