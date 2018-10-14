import Cocoa

NSApplication.shared

let window = NSWindow(contentRect: NSMakeRect(0, 0, 320, 200),
                      styleMask: NSWindow.StyleMask.titled,
                      backing: .buffered,
                      `defer`: true

)

window.orderFrontRegardless()


NSApp.run()

