EXPORT_ASSERT_TO_GLOBALS = true
require("test.luaunit")

request = require("lib.request")

function testGenericRequest()
  local data = "GET /search?q=lua&client=safari HTTP/1.1\r\n" ..
               "Host: www.google.com\r\n" ..
               "Connection: keep-alive\r\n" ..
               "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\r\n" ..
               "\r\n"

  local r = request.parse(data)

  assertEquals(r.method, "GET")
  assertEquals(r.path, "/search")
  assertEquals(r.params, {q = "lua", client = "safari"})
end

os.exit(LuaUnit.run())
