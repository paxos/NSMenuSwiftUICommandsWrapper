//
//  DemoApp.swift
//  Demo
//
//  Created by Patrick Dinger on 02.04.2024.
//

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
