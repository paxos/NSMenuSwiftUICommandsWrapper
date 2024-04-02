//
//  ContentView.swift
//  MenuWrapper
//
//  Created by Patrick Dinger on 02.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            AppKitView()
                .frame(width: 100, height: 100, alignment: .center)
            Text("SwiftUI View")
                .frame(width: 100, height: 100, alignment: .center)
                .contextMenu {
                    MWMenuExample.menu.toView()
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
