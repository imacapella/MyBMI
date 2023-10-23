//
//  MyBMIApp.swift
//  MyBMI
//
//  Created by Gürkan Karadaş on 18.10.2023.
//

import SwiftUI

@main
struct MyBMIApp: App {
    @Environment(\.colorScheme) var colorScheme
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
