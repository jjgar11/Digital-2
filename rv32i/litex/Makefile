PLATFORM	= alpha_board
TARGET		= base
BUILD_DIR	= build/$(PLATFORM)_project/gateware

TARGETOLD	= colorlight_5a_75e
BUILD_DIROLD= build/$(PLATFORM)/gateware
BUILD_FLAGS	= --with-ethernet --use-internal-osc
NET_FLAGS	= --eth-ip 192.168.1.50 --eth-phy 0

build-old:
#	./targets/colorlight_5a_75x.py  --board 5a-75e --revision 6.0 --with-ethernet --use-internal-osc --build
	./targets/$(TARGETOLD).py $(BUILD_FLAGS) $(NET_FLAGS) --build

configure-old:
	sudo openFPGALoader -c ft232RL --pins=RXD:RTS:TXD:CTS -m $(BUILD_DIROLD)/$(PLATFORM).bit

build:
	./targets/$(TARGET).py

configure:
	sudo openFPGALoader -c ft232RL --pins=RXD:RTS:TXD:CTS -m $(BUILD_DIR)/$(PLATFORM).bit

clean:
	rm -rf build

.PHONY: build configure clean