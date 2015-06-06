local config = require("config")

wifi.setmode(wifi.STATION)
wifi.sta.config(config.wifi.ssid, config.wifi.password)
wifi.sta.connect()

tmr.alarm(0, 1000, 1, function()
  if wifi.sta.getip() then
    tmr.stop(0)
    print("IP:  " .. wifi.sta.getip())
    print("MAC: " .. wifi.sta.getmac())
    dofile("app.lua")
  else
    print("Getting an IP...")
  end
end)
