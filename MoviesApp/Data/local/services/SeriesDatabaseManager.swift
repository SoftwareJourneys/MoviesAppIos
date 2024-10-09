import SwiftData
import SwiftUI

class SeriesDatabaseManager: SeriesDatabaseProtocol {
    
    let modelContainer: ModelContainer
    let modelExecutor: any ModelExecutor
    let modelContext: ModelContext
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
        modelContext = ModelContext(modelContainer)
        modelExecutor = DefaultSerialModelExecutor(modelContext: modelContext)
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
    
}
