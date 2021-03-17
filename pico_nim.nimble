# Package

version       = "0.1.0"
author        = "Jason"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"

task make, "Creates the C sources":
  exec("nim c -c --nimcache:csource --gc:arc --cpu:arm --os:any -d:release -d:useMalloc ./src/pico_nim.nim")
  mvFile("./csource/" & "@mpico_nim.nim.c", "./csource/" & "pico_nim.c")
  mvFile("./csource/CMakeLists.txt", "./csource/CMakeLists.txt1")
  mvFile("./csource/CMakeLists.txt1", "./csource/CMakeLists.txt")

  exec("make -C ./csource/build")
task listen, "Listens to the usb debug":
  exec("sudo minicom -b 115200 -o -D /dev/ttyACM0")
# Dependencies

requires "nim >= 1.4.2"
requires "https://github.com/beef331/picostdlib"
