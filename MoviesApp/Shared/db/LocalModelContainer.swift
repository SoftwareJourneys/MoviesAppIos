//
//  LocalModelContainer.swift
//  MoviesApp
//
//  Created by Work on 10/9/24.
//

import Foundation
import SwiftData

class LocalModelContainer {
    static let shared = LocalModelContainer()
    
    let sharedModelContainer: ModelContainer = {
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
}
