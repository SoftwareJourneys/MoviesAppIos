//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import SwiftUI
import SwiftData
import Factory

@main
struct MoviesAppApp: App {
    private var sharedModelContainer = LocalModelContainer.shared.sharedModelContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(sharedModelContainer)
    }
}
