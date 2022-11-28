//
//  AppDelegate.swift
//  FlowTime
//
//  Created by Leonardo Migliorelli on 28/11/22.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    // We need to declare NSStatusItem here, otherwise it gets destroyed after applicationDidFinishLaunching is called
    var statusBarItem: NSStatusItem!
    // An object that manages an app’s menus.
    var statusBarMenu: NSMenu! = .init()
    let item: NSMenuItem = NSMenuItem(title: "FlowTime", action: #selector(activate), keyEquivalent: "")

    func applicationDidFinishLaunching(_ notification: Notification) {

        // Returns a newly created status item that has been allotted a specified space within the status bar.
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusBarItem.button?.image = NSImage(
                systemSymbolName: "play.fill",
                accessibilityDescription: "Status bar icon"
        )

        statusBarMenu.addItem(item)

        // Add menu to statusbar
        statusBarItem.menu = statusBarMenu
    }

    func applicationDidBecomeActive(_ notification: Notification) {
        activate()
    }

    @objc func activate() {
        NSApp.activate(ignoringOtherApps: true)
    }

}
