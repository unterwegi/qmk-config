# My QMK keyboard setup

This repo contains my own QMK keymap config for my Glorious GMMK 2 Compact Keyboard.

It follows a layout as described in this [Post@Medium](https://medium.com/@patrick.elmquist/separate-keymap-repo-for-qmk-136ff5a419bd)
to separate the main qmk_firmware repository from my own configuration.

## QMK setup

Assuming you are in the root directory of this repository:

```bash
git submodule update --init --recursive
python3 -m pip install --user qmk
sudo cp qmk_firmware/util/udev/50-qmk.rules /etc/udev/rules.d/
qmk setup -y -H $PWD/qmk_firmware
```
