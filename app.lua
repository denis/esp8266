require("lib.sinatra")

get("/", function(params)
  return [[
    <h1>GET /</h1>

    <form action="/alarms" method="POST">
      <input type="text" name="name" placeholder="Name">
      <input type="text" name="size" placeholder="Size">
      <input type="submit" value="Create">
    </form>
  ]]
end)

post("/alarms", function(params)
  return string.format([[
    <h1>POST /alarms</h1>
    <p>Name: %s</p>
    <p>Size: %s</p>
    <p><a href="/">Back</a></p>
  ]], params.name, params.size)
end)
