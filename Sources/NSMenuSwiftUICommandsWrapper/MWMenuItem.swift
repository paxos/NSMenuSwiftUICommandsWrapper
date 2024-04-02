//
//  File.swift
//  
//
//  Created by Patrick Dinger on 02.04.2024.
//

import AppKit
import Foundation
import SwiftUI

public struct MWMenuItem: Identifiable {
    public init(
        id: String = UUID().uuidString,
        action: MWMenuActionCallback = nil,
        labelCallback: MWMenuLabelCallback = nil,
        label: String? = nil,
        keyEquivalent: String = "",
        modifierFlags: NSEvent.ModifierFlags? = nil
    ) {
        self.id = id
        self.action = action
        self.labelCallback = labelCallback
        self.label = label
        self.keyEquivalent = keyEquivalent
        self.modifierFlags = modifierFlags
    }

    public var id = UUID().uuidString

    let action: MWMenuActionCallback
    let labelCallback: MWMenuLabelCallback
    let label: String?
    var keyEquivalent: String = ""
    var modifierFlags: NSEvent.ModifierFlags? = nil

    @MainActor
    public func toCommandButton() -> some View {
        return Button(label ?? labelCallback?() ?? "None") {
            action?()
        }
        .keyboardShortcut(
            KeyEquivalent(Character(keyEquivalent)),
            modifiers: modifierFlags?.toSwiftUIModifier() ?? [.command]
        )
    }

    public func toMenuItem() -> NSMenuItem {
        let item = NSMenuItem(
            title: label ?? "None",
            action: #selector(MWNenu.actionDispatcher),
            keyEquivalent: keyEquivalent
        )

        if let modifierFlags {
            item.keyEquivalentModifierMask = modifierFlags
        }

        return item
    }
}
