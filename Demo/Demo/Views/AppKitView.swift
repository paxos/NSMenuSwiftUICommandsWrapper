//
//  AppKitView.swift
//  MenuWrapper
//
//  Created by Patrick Dinger on 02.04.2024.
//

import Foundation
import SwiftUI

struct AppKitView: NSViewRepresentable {
    func updateNSView(_: NSViewType, context _: Context) {}

    func makeNSView(context _: Context) -> some NSView {
        let view = MyBox()
        view.title = "Right Click me"
        return view
    }
}

class MyBox: NSBox {
    override func menu(for _: NSEvent) -> NSMenu? {
        return MWMenuExample.menu.toMenu()
    }
}
