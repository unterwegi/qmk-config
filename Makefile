USER = unterwegi
KEYBOARD = gmmk2_p65_iso
KEYBOARD_PATH = gmmk/gmmk2/p65/iso

all: build flash

.PHONY: build
build:
	# init submodule
	git submodule update --init --recursive
	git submodule foreach git pull origin master
	git submodule foreach make git-submodule 

	# cleanup old symlinks
	rm -rf qmk_firmware/keyboards/$(KEYBOARD_PATH)/keymaps/$(USER)

	# add new symlinks
	ln -s $(shell pwd)/$(KEYBOARD) qmk_firmware/keyboards/$(KEYBOARD_PATH)/keymaps/$(USER)

	# run lint check
	cd qmk_firmware; qmk lint -km $(USER) -kb $(KEYBOARD_PATH) --strict

	# run build
	make -j1 -C qmk_firmware $(KEYBOARD_PATH):$(USER)

flash:
	# run flash
	cd qmk_firmware; qmk flash -km $(USER) -kb $(KEYBOARD_PATH)

clean:
	rm -rf ./qmk_firmware/
	rm -rf ./build/
	rm -rf qmk_firmware/keyboards/$(KEYBOARD_PATH)/keymaps/$(USER)


