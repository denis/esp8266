local uri = require("lib.uri")

local request = {}

function request.parse(request)
  local request_line = request:sub(1, request:find("\r\n") - 1)
  local _, _, method, request_uri = request_line:find("(%u+) (.*) HTTP/%d+%.%d+")

  local parsed_uri = uri.parse(request_uri)

  local params = {}

  for k, v in parsed_uri.query:gmatch("([^&]+)=([^&]*)") do
    params[k] = v
  end

  if method == "POST" then
    request_body = request:sub(request:find("\r\n\r\n") + 4, -1)

    for k, v in request_body:gmatch("([^&]+)=([^&]*)") do
      params[k] = v
    end
  end

  return {
    method = method,
    path = parsed_uri.path,
    params = params
  }
end

return request
