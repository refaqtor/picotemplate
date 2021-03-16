cmake_minimum_required(VERSION 3.13)

# initialize pico-sdk from GIT
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_FETCH_FROM_GIT on)

# pico_sdk_import.cmake is a single file copied from this SDK
# note: this must happen before project()
include(pico_sdk_import.cmake)

project(my_project)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()
FILE(GLOB MyCSources *.c)
ADD_EXECUTABLE(pico_nim ${MyCSources})

# Pull in our pico_stdlib which aggregates commonly used features
# hardware_adc tinyusb_device tinyusb_board Currently supported.
target_link_libraries(pico_nim pico_stdlib  hardware_adc)

# enable usb output, disable uart output
pico_enable_stdio_usb(pico_nim 1)
pico_enable_stdio_uart(pico_nim 0)

# create map/bin/hex/uf2 file etc.
pico_add_extra_outputs(pico_nim)

# add url via pico_set_program_url
pico_set_program_url(pico_nim 1)