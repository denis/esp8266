local routes = {
  HEAD = {},
  GET = {},
  POST = {}
}

local function route(method, path, block)
  routes[method][path] = block
end

function head(path, block)
  route("HEAD", path, block)
end

function get(path, block)
  route("GET", path, block)
  route("HEAD", path, block)
end

function post(path, block)
  route("POST", path, block)
end

local function start_server()
  print("* Listening on http://" .. wifi.sta.getip())
  print("== Sinatra has taken the stage")

  local server = net.createServer(net.TCP, 5)

  server:listen(80, function(connection)
    connection:on("receive", function(connection, data)
      local s, e, method, path = data:find("([A-Z]+) (.*) HTTP\/1\.1")

      if routes[method] and routes[method][path] then
        connection:send("HTTP/1.1 200 OK\r\n")
        connection:send("Content-Type: text/html\r\n")
        connection:send("\r\n")
        connection:send(routes[method][path]())
      else
        connection:send("HTTP/1.1 404 Not Found\r\n")
        connection:send("\r\n")
      end
    end)

    connection:on("sent", function(connection)
      connection:close()
    end)
  end)
end

start_server()
