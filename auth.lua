local sha1 = require 'sha1'
local base64 = require 'base64'
local query_args = ngx.req.get_uri_args()
local hmac = ""
local timestamp = ""
local validateToken = require 'validate-token'

if query_args ~= nil then
 
  local valid = validateToken(query_args["apiKey"])

  if valid == true then 
    return  
  end

end

ngx.status = 401
ngx.say("Please provide a valid apiKey")
