# ESP8266

    git clone --recursive https://github.com/denis/esp8266.git
    cd esp8266

Create a config file and provide your SSID and password for Wi-Fi connection:

    cp config.lua.sample config.lua

To upload code into your ESP8266 board run:

    make upload

To run tests:

    make

Denis Barushev <barushev@gmail.com>
