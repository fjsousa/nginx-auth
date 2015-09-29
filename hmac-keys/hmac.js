var ttl = Date.now() + 3600 * 1000;
console.log(ttl + ':' + require('crypto').createHmac('sha1', 'sugarbears').update(ttl.toString()).digest('hex'));
