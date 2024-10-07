import SwiftData
import SwiftUI

class MoviesDatabaseManager {
    let container = try! ModelContainer(for: MovieDB.self)
    
    static let shared = MoviesDatabaseManager()

    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }

    @MainActor
    func saveMovies(movies: [MovieDB]) {
        for movie in movies {
            modelContext.insert(movie)
        }
        do {
            try modelContext.save()
        } catch {
            print("Error saving movies: \(error)")
        }
    }

    @MainActor
    func getMoviesByCategory(category : String) -> [MovieDB]{
        let moviePredicate = #Predicate<MovieDB> { movie in
            movie.category == category
        }
        let fetchDescriptor = FetchDescriptor<MovieDB>(predicate: moviePredicate,
                                                     sortBy: [SortDescriptor<MovieDB>(\.title)])
        let movies = try? modelContext.fetch(fetchDescriptor)
        return movies ?? []
    }
    
    @MainActor
    func getMovieById(id: Int64) -> MovieDB? {
        let idPredicate = #Predicate<MovieDB> { movie in
            movie.id == id
        }
        let fetchDescriptor = FetchDescriptor<MovieDB>(predicate: idPredicate)
        
        do {
            let movies = try modelContext.fetch(fetchDescriptor)
            return movies.first
        } catch {
            print("Error fetching series by id: \(error)")
            return nil
        }
    }

}
