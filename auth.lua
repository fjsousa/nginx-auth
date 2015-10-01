local sha1 = require 'sha1'
local base64 = require 'base64'
local query_args = ngx.req.get_uri_args()
local hmac = ""
local timestamp = ""
local validateToken = require 'lib/validate-token'

if query_args ~= nil then
  local apiKeybase64 = query_args["apiKey"]
  local valid = validateToken(query_args["apiKey"])

  if valid == true then 
    query_args["apiKey"] = nil --clean up apiKey
    local newArgs = query_args --assign new apiKey
    ngx.req.set_uri_args(newArgs)
    return  
  end
  

end

ngx.status = 401
ngx.say("Please provide a valid apiKey")
