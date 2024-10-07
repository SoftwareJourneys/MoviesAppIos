import SwiftData
import SwiftUI

class SeriesDatabaseManager {
    let container = try! ModelContainer(for: SeriesDB.self)
    
    static let shared = SeriesDatabaseManager()

    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }

    @MainActor
    func saveSeries(series: [SeriesDB]) {
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
        let series = try? modelContext.fetch(fetchDescriptor)
        return series ?? []
    }
    
    @MainActor
    func getSerieById(id: Int64) -> SeriesDB? {
        let idPredicate = #Predicate<SeriesDB> { serie in
            serie.id == id
        }
        let fetchDescriptor = FetchDescriptor<SeriesDB>(predicate: idPredicate)
        
        do {
            let series = try modelContext.fetch(fetchDescriptor)
            return series.first
        } catch {
            print("Error fetching series by id: \(error)")
            return nil
        }
    }

}
