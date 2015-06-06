require("sinatra")

get("/", function()
  return [[
    <h1>GET /</h1>

    <form action="/alarms" method="POST">
      <input type="text" name="name">
      <input type="submit">
    </form>
  ]]
end)

post("/alarms", function()
  return [[
    <h1>POST /alarms</h1>
    <p><a href="/">Back</a></p>
  ]]
end)
