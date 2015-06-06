EXPORT_ASSERT_TO_GLOBALS = true
require("test.luaunit")

uri = require("lib.uri")

function testRootPath()
  local u = uri.parse("/")
  assertEquals(u.path, "/")
end

function testGenericPath()
  local u = uri.parse("/search")
  assertEquals(u.path, "/search")
end

function testPathWithQueryString()
  local u = uri.parse("/search?q=lua")
  assertEquals(u.path, "/search")
  assertEquals(u.query, "q=lua")
end

function testMultipleQueryParams()
  local u = uri.parse("/search?q=lua&client=safari")
  assertEquals(u.query, "q=lua&client=safari")
end

function testQueryStringWithMultipleQuestionMarks()
  local u = uri.parse("/search?q=lua&mobile?=true")
  assertEquals(u.query, "q=lua&mobile?=true")
end

function testPathWithFragment()
  local u = uri.parse("/search#results")
  assertEquals(u.path, "/search")
  assertEquals(u.fragment, "results")
end

function testPathWithQueryStringAndFragment()
  local u = uri.parse("/search?q=lua#results")
  assertEquals(u.path, "/search")
  assertEquals(u.query, "q=lua")
  assertEquals(u.fragment, "results")
end

os.exit(LuaUnit.run())
