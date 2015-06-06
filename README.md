# ESP8266

    git clone --recursive https://github.com/denis/esp8266.git
    cd esp8266
    pip install pyserial

Create a config file and provide your SSID and password for Wi-Fi connection:

    cp config.lua.sample config.lua

To upload code into your ESP8266 board run:

    make upload

To run tests:

    make

[Denis Barushev](mailto:barushev@gmail.com?subject=ESP8266) 2015 MIT License
