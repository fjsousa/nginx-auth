local sha1 = require("sha1")
local query_args = ngx.req.get_uri_args()
local hmac = ""
local timestamp = ""

if query_args ~= nil then
 
  local apikey = query_args["apikey"]

  if apikey ~= nil then 

    local divider = apikey:find(":")
    hmac = apikey:sub(divider+1)
    timestamp = apikey:sub(0, divider-1)

    local hmachex = sha1.hmac("sugarbears", timestamp)
    ngx.say('key:' .. hmac .. timestamp .. hmachex)

    if hmachex  == hmac and tonumber(timestamp) >= os.time() then
        return
    end
  end

end


--redirect to auth
  
