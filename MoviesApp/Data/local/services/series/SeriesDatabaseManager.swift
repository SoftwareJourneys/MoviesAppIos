import SwiftData
import SwiftUI

class SeriesDatabaseManager {
    let container = try! ModelContainer(for: SeriesDB.self)

    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }

    @MainActor
    func saveMovies(series: [SeriesDB]) {
        for serie in series {
            modelContext.insert(serie)
        }
        do {
            try modelContext.save()
        } catch {
            print("Error saving series: \(error)")
        }
    }

    @MainActor
    func getSeriesByCategory(category : String) -> [SeriesDB]{
        let seriePredicate = #Predicate<SeriesDB> { serie in
            serie.category == category
        }
        let fetchDescriptor = FetchDescriptor<SeriesDB>(predicate: seriePredicate,
                                                     sortBy: [SortDescriptor<SeriesDB>(\.name)])
        let series = try! modelContext.fetch(fetchDescriptor)
        return series
    }

}
