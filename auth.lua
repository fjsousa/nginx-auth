local sha1 = require 'sha1'
local base64 = require 'base64'
local query_args = ngx.req.get_uri_args()
local hmac = ""
local timestamp = ""

if query_args ~= nil then
 
  local apiKeybase64 = query_args["apiKey"]
  if apiKeybase64 ~= nil then 

    local apiKey = base64.decode(apiKeybase64)
    local divider = apiKey:find(":")
    hmac = apiKey:sub(divider+1)
    timestamp = apiKey:sub(0, divider-1)

    local hmachex = sha1.hmac("sugarbears", timestamp)
    if hmachex  == hmac and tonumber(timestamp) >= os.time() then
      return --token is valid and authentic
    end
  end

end

ngx.status = 401
ngx.say("Please provide a valid apiKey")
