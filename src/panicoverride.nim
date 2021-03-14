import picostdlib
proc panic*(str: cstring) = 
  print str
  quit 1
proc rawOutput*(str: cstring) =
  print str
  quit 1