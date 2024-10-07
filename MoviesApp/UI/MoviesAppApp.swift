//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import SwiftUI
import SwiftData

@main
struct MoviesAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MovieDB.self,
            SeriesDB.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
