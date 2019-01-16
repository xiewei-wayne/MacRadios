//
//  AppDelegate.swift
//  Radios
//
//  Created by Wayne on 2019/1/16.
//  Copyright © 2019 xiewei.max@gmail.com. All rights reserved.
//

// ref: https://www.raywenderlich.com/450-menus-and-popovers-in-menu-bar-apps-for-macos

import Cocoa
import AVFoundation


final class AppDelegate: NSObject, NSApplicationDelegate {

	let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
	
	private var player : AVPlayer?
	private var radioStreamIndex: Int = 0;
	
	// validate values stored in NSUserDefaults and reset to default if necessary
	func applicationDidFinishLaunching(_: Notification) {

		initStatusButton();
		
		initMainMenu();
		
		// play automatically
		playRadioStreamByIndex(streamIndex: 3)
	}
	
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}

	func application(_ sender: NSApplication, openFile filename: String) -> Bool {
		return true;
	}

	func playAudoByUrl(audioUrl: String) {
		guard let url = URL(string: audioUrl) else {
			return
		}
		
		// Create an AVPlayer, passing it the HTTP Live Streaming URL.
		// auto release former instance
		self.player = AVPlayer(url: url)
		self.player?.play()
	}
	
	func playRadioStreamByIndex(streamIndex: Int) {
		let radioStream = radioArray[streamIndex]
		statusItem.menu?.items[0].title = "Playing: " + radioStream.name
		
		playAudoByUrl(audioUrl: radioStream.url)
	}
	
	@objc func playRadioStreamByClickingMenu(_ sender: NSMenuItem) {
		let streamIndex = sender.tag
		let radioStream = radioArray[streamIndex]
		statusItem.menu?.items[0].title = "Playing: " + radioStream.name
		
		playAudoByUrl(audioUrl: radioStream.url)
	}
	
	

	func initStatusButton() {
		if let button = statusItem.button {
			button.image = NSImage(named:NSImage.Name("StatusBarIcon"))
		}
	}

	func initMainMenu() {
		let menu = NSMenu()

		let menuItem = NSMenuItem(title: "playing...", action: nil, keyEquivalent: "")
		menu.addItem(menuItem)

		for i in 0 ..< radioArray.count {
			let radioStream = radioArray[i]
			let menuItem = NSMenuItem(title: radioStream.name, action: #selector(AppDelegate.playRadioStreamByClickingMenu(_:)), keyEquivalent: "")
			menuItem.tag = i
			menuItem.target = self
			menu.addItem(menuItem)
		}
		
		menu.addItem(NSMenuItem.separator())
		menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

		statusItem.menu = menu
	}
}
