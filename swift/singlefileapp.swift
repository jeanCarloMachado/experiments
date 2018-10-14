import Cocoa

NSApplication.shared

let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

statusItem.title = "Quit"
statusItem.action = "terminate:"


NSApp.run()
