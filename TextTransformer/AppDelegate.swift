//
//  AppDelegate.swift
//  TextTransformer
//
//  Created by Bharath  Raj kumar on 14/04/19.
//  Copyright © 2019 Bharath Raj Kumar. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:  NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem.button?.title = "⍺"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

   @objc func showSettings()
   {
    let storyboard = NSStoryboard(name: "Main", bundle: nil)
     guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else {
        fatalError("Error in Stroyboard")
    }
    
    guard let button = statusItem.button else
    {
         fatalError("Error in button")
    }
    
    let popoverView = NSPopover()
    popoverView.contentViewController = vc
    popoverView.behavior = .transient
    popoverView.show(relativeTo:  button.bounds, of: button, preferredEdge: .maxY )
    
    }

}

