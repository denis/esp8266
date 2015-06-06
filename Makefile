NODEMCU_UPLOADER=vendor/nodemcu-uploader/nodemcu-uploader.py
ESPTOOL=vendor/esptool/esptool.py
PORT=/dev/tty.SLAB_USBtoUART
BAUD=115200

upload:
	@$(NODEMCU_UPLOADER) --port $(PORT) --baud $(BAUD) upload $(wildcard *.lua) $(wildcard lib/*.lua)

format:
	@$(NODEMCU_UPLOADER) --port $(PORT) --baud $(BAUD) file format

flash_nodemcu:
	wget https://github.com/nodemcu/nodemcu-firmware/releases/download/0.9.6-dev_20150406/nodemcu_integer_0.9.6-dev_20150406.bin
	@$(ESPTOOL) --port $(PORT) --baud $(BAUD) write_flash 0x00000 nodemcu_integer_0.9.6-dev_20150406.bin
	rm nodemcu_integer_0.9.6-dev_20150406.bin

