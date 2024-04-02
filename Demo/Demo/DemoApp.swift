// DemoApp.swift
// Made by paxos in Apr 2, 2024

import NSMenuSwiftUICommandsWrapper
import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            MWMenuExample.menu.toCommands()
        }
    }
}
