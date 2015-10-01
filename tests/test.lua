local validateToken = require '/lib/validate-token'
local base64 = require 'base64'
local sha1 = require 'sha1'
local secret = 'sugarbears'

local timestamp = (os.time() + 3600 ) * 1000
local validToken = base64.encode('' .. timestamp .. ':' .. sha1.hmac(secret, '' .. timestamp))
assert(validateToken(validToken), 'Valid token failed')

timestamp = (os.time() - 3600 ) * 1000
local expiredToken = base64.encode('' .. timestamp .. ':' .. sha1.hmac(secret, '' .. timestamp))
assert(validateToken(expiredToken) == false, 'Expired token should return false')

timestamp = (os.time() + 3600 ) * 1000
local invalidHmac = base64.encode('' .. timestamp .. ':' .. sha1.hmac(secret, '' .. timestamp) .. 'bla!')
assert(validateToken(invalidHmac) == false, 'Invalid hmac should return false')

local invalidToken = "sdfsdfsdfsdfsd"
assert(validateToken(invalidToken) == false, 'Invalid token should return false')

local invalidToken2 = "sdfsdfsdfsdfsd:asdasdasasdas"
assert(validateToken(invalidToken2) == false, 'Invalid token 2 should return false')

print('tests ok')
