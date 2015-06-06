EXPORT_ASSERT_TO_GLOBALS = true
require("test.luaunit")

request = require("lib.request")

function testGetRequest()
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

function testPostRequest()
  local data = "POST /users?utf8=true HTTP/1.1\r\n" ..
               "Host: www.google.com\r\n" ..
               "Connection: keep-alive\r\n" ..
               "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\r\n" ..
               "\r\n" ..
               "name=Denis&age=30"

  local r = request.parse(data)

  assertEquals(r.method, "POST")
  assertEquals(r.path, "/users")
  assertEquals(r.params, {utf8 = "true", name = "Denis", age = "30"})
end

function testPostRequestWithEmptyValues()
  local data = "POST /users HTTP/1.1\r\n" ..
               "\r\n" ..
               "name=&age="

  local r = request.parse(data)

  assertEquals(r.method, "POST")
  assertEquals(r.path, "/users")
  assertEquals(r.params, {name = "", age = ""})
end

os.exit(LuaUnit.run())
