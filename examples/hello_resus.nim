import picostdlib
import picostdlib/[pll, clock]
{.warning: "Uncertain if this example properly works.".}
var seenResus = false

proc resusCallback {.noConv.} =
  PllSys.init(1, 1500 * Mhz, 6, 2)
  discard clockConfigure(ClockIndex.sys, CtrlSrcValueClksrcClkSysAux, CtrlAuxsrcValueClksrcPllSys,
      125u32 * Mhz, 125u32 * Mhz)
  stdioInitAll()
  print("Resus event fired \n")
  defaultTxWaitBlocking()
  seenResus = true


proc main() =
  enableResus(resusCallback)
  stdioInitAll()

  print("Hello resus \n")
  seenResus = false
  PllSys.deinit
  while not seenResus: discard
main()
