//
//  AppInjection.swift
//  MoviesApp
//
//  Created by Work on 10/8/24.
//


import Foundation
import Factory
import SwiftData

extension Container {
    
    // DB
    var modelContainerService: Factory<ModelContainer> {
        self {
            
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
            
            return sharedModelContainer
            
        }.singleton
    }
    
    var moviesDb: Factory<MoviesDatabaseManager> {
        self {
            MoviesDatabaseManager(modelContainer: self.modelContainerService())
        }.singleton
    }
    
    var seriesDb: Factory<SeriesDatabaseManager> {
        self {
            SeriesDatabaseManager(modelContainer: self.modelContainerService())
        }.singleton
    }
    // Services
    var seriesService: Factory<SeriesService> {
        self {
            SeriesService()
        }.singleton
    }
    
    var moviesService: Factory<MoviesService> {
        self {
            MoviesService()
        }.singleton
    }
    
    //ViewModels
    var mediaViewModel: Factory<MediaViewModel> {
        self { MediaViewModel()}
    }
    
    //Repositories
    var mediaRepository: Factory<MediaRepository> {
        self {
            MediaRepository(
                movieService: self.moviesService(),
                seriesService: self.seriesService(),
                seriesDB: self.seriesDb(),
                moviesDB: self.moviesDb()
            )
        }
    }
    
}
