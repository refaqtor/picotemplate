import picostdlib
import picostdlib/[sevensegdisplay, time, adc, gpio]

# This module reads the voltage on pin 26 using ADC and outputs the value between 3.15 - 3.3 in hex(0-F) on the
# seven segmented display.

proc setupPins =
  # My pins are gp 0 to 8 for panel
  # Though it goes a, b, c, dp, d, e, g, f
  var i = 0
  for x in SevenSeg:
    SevenSegPins[x] = i.Gpio
    inc i
  let 
    gPin = SevenSegPins[f]
  SevenSegPins[f] = SevenSegPins[g]
  SevenSegPins[g] = gPin

stdioInitAll()
setupPins()
initPins()
adcInit()
26.Gpio.initAdc()
Adc26.selectInput

var 
  averageDat: array[30, float32]
  pos = 0

while true:
  let input = (adcRead().float32 * ThreePointThreeConv)
  averageDat[pos] = input
  pos = (pos + 1).mod(averageDat.len)
  let average = block:
    var res = 0f
    for x in averageDat:
      res += x
    res / averageDat.len.float32
  let toDraw = (((average - 3.15f) / 0.15f) * 16f).clamp(0, 16).CharacterName
  toDraw.draw
