local uri = {}

function uri.parse(uri)
  local _, _, path, query, fragment = uri:find("^([^?#]+)%??([^#]*)#?(.*)$")

  return {
    -- scheme = "http",
    -- userinfo = "user:password",
    -- host = "google.com",
    -- port = 80,
    path = path,
    query = query,
    fragment = fragment
  }
end

return uri
