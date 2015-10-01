local sha1 = require 'sha1'
local secret = "sugarbears"
local base64 = require 'base64'

function validToken(apiKeybase64)
  if apiKeybase64 ~= nil then
    local apiKey = base64.decode(apiKeybase64)

    if apiKey == nil then
      return false -- decoding return nil if apiKeybase64 is invalid base64
    end

    local divider = apiKey:find(":")
    
    if divider == nil then
      return false
    end

    hmac = apiKey:sub(divider+1)
    timestamp = apiKey:sub(0, divider-1)
    local hmachex = sha1.hmac(secret, timestamp)
    if hmachex  == hmac and tonumber(timestamp) >= os.time()*1000 then
      return true --token is valid and authentic
    end

    return false
  end

  return false
end

return validToken
