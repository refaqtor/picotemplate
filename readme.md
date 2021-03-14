# Raspberry Pi Pico template project

## How To Use
Clone this repo, copy your `nimbase.h` into the csource folder.

Navigate to the build folder and run `cmake ..` (This will take some time since fetching pico-sdk through git).

Then run `nimble make` and copy `csource/build/pico_nim.uf2` to the pico when it's in bootsel mode.

Finally with that image running you can `nimble listen` which should listen to the pico on the usb uart, printing the message in the `pico_nim.nim` file.

Now you can write any code you want using the `picostdlib`.