//
//  File.swift
//  
//
//  Created by Patrick Dinger on 02.04.2024.
//

import AppKit
import Foundation
import SwiftUI

public class MWNenu {
    @MainActor
    public init(items: [MWMenuItem], title: String, actions: [MWMenuActionCallback] = []) {
        self.items = items
        self.title = title
        self.actions = actions
    }

    let items: [MWMenuItem]
    let title: String

    @MainActor
    var actions: [MWMenuActionCallback] = []

    init(title: String, items: [MWMenuItem]) {
        self.title = title
        self.items = items
    }

    @MainActor @objc
    func actionDispatcher(sender: NSMenuItem) {
        let actionsCopy = actions

//        let usedKeyboardCommand = NSApp.currentEvent?.type == .keyDown

        if let action = actionsCopy[sender.tag] {
            action()
        }
    }

    @MainActor
    public func toMenu() -> NSMenu {
        let menu = NSMenu(title: title)

        for item in items {
            let menuItem = item.toMenuItem()
            menuItem.target = self

            menu.addItem(menuItem)

            menuItem.tag = actions.count
            actions.append(item.action)
        }

        return menu
    }

    @MainActor
    public func toCommands() -> some Commands {
        CommandMenu(title) {
            self.toView()
        }
    }

    @MainActor
    public func toView() -> some View {
        ForEach(items) { item in
            item.toCommandButton()
        }
    }
}
