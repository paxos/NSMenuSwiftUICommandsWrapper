// MWTypes.swift
// Made by paxos in Apr 2, 2024

import AppKit
import Foundation
import SwiftUI

public typealias MWMenuActionCallback = (@MainActor () -> Void)?
public typealias MWMenuLabelCallback = (@MainActor () -> String)?
public struct MWMenuActionCallbackProps {
    let triggeredViaKeyboard: Bool
}

extension NSEvent.ModifierFlags {
    func toSwiftUIModifier() -> EventModifiers {
        var result: EventModifiers = []

        // TODO: Add all
        if self.contains(.command) {
            result.insert(.command)
        }

        if self.contains(.shift) {
            result.insert(.shift)
        }

        if self.contains(.control) {
            result.insert(.control)
        }

        return result
    }
}
