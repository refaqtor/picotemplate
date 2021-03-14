# Raspberry Pi Pico template project
## Dependancies:

All Nim dependancies can be fetched(after nimble is installed) with, `nimble install --depsOnly`.

Since we're using the C project all of the [dependancies](https://github.com/raspberrypi/pico-sdk#quick-start-your-own-project) apply from the pico-sdk, so fetch all those aswell.


## How To Use
Clone this repo, copy your `nimbase.h` into the csource folder(If using choosenim can be found at `~/.choosenim/toolchains/$yourNimVersion/lib/nimbase.h`).

Navigate to the build folder and run `cmake ..` (This will take some time since fetching pico-sdk through git).

Then run `nimble make` and copy `csource/build/pico_nim.uf2` to the pico when it's in bootsel mode.
If this errors try resaving the `csource/CMakeLists` file.

Finally with that image running you can `nimble listen` which should listen to the pico on the usb uart, printing the message in the `pico_nim.nim` file.

Now you can write any code you want using the `picostdlib`.