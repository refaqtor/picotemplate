# Package

version       = "0.1.0"
author        = "Jason"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"

task make, "Creates the C sources":
  exec("nim c -c --nimcache:csource --gc:arc --cpu:arm --os:standalone -d:danger -d:useMalloc ./src/pico_nim.nim")
  mvFile("./csource/" & "@mpico_nim.nim.c", "./csource/" & "pico_nim.c")
  exec("make -C ./csource/build")
task listen, "Listens to the usb debug":
  exec("sudo minicom -b 115200 -o -D /dev/ttyACM0")
# Dependencies

requires "nim >= 1.4.2"
