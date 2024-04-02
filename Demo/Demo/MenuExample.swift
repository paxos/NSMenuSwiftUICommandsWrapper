//
//  MenuExample.swift
//  Demo
//
//  Created by Patrick Dinger on 02.04.2024.
//

import Foundation
import NSMenuSwiftUICommandsWrapper

@MainActor
class MWMenuExample {
    static let menu = MWNenu(items: [
        .init(action: { print("Hello") }, labelCallback: nil, label: "Hello", keyEquivalent: "e"),
        .init(
            action: nil,
            labelCallback: { UUID().uuidString },
            label: nil,
            keyEquivalent: "d",
            modifierFlags: [.shift]
        ),
    ], title: "Test Menu")
}
