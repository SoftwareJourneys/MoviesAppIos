import SwiftUI
import Foundation

struct Details: View {
    @State private var selectedIndex: Int = 0
    
    let previewMovie:MovieUI = MovieUI(adult: false,
                                       backdropPath: "https://example.com/backdrop1.jpg",
                                       genreIds: [1, 2],
                                       id: 1,
                                       originCountry: ["USA"],
                                       originalLanguage: "en",
                                       originalName: "Pinocchio",
                                       overview: "A computer hacker learns about the true nature of his reality.",
                                       popularity: 8.7,
                                       posterPath: "https://www.ecartelera.com/carteles/11500/11504/001_p.jpg",
                                       firstAirDate: "1999-03-31",
                                       name: "Pinocho",
                                       voteAverage: 8.7,
                                       voteCount: 1800)
    
    let previewMokedMovies: [MovieUI] = [
        MovieUI(adult: false,
                backdropPath: "https://example.com/backdrop1.jpg",
                genreIds: [1, 2], // Cambia por IDs de géneros reales
                id: 1,
                originCountry: ["USA"],
                originalLanguage: "en",
                originalName: "The Matrix",
                overview: "A computer hacker learns about the true nature of his reality.",
                popularity: 8.7,
                posterPath: "https://m.media-amazon.com/images/I/71PfZFFz9yL._AC_SL1000_.jpg",
                firstAirDate: "1999-03-31",
                name: "The Matrix",
                voteAverage: 8.7,
                voteCount: 1500),
        
        MovieUI(adult: false,
                backdropPath: "https://example.com/backdrop2.jpg",
                genreIds: [1, 3], // Cambia por IDs de géneros reales
                id: 2,
                originCountry: ["USA"],
                originalLanguage: "en",
                originalName: "Inception",
                overview: "A thief who steals corporate secrets through the use of dream-sharing technology.",
                popularity: 8.8,
                posterPath: "https://i.blogs.es/5b0845/stranger-things-2-poster-teaser-netflix/1366_2000.jpg",
                firstAirDate: "2010-07-16",
                name: "Inception",
                voteAverage: 8.8,
                voteCount: 2000),

        MovieUI(adult: false,
                backdropPath: "https://example.com/backdrop1.jpg",
                genreIds: [1, 2],
                id: 3,
                originCountry: ["USA"],
                originalLanguage: "en",
                originalName: "The Matrix",
                overview: "A computer hacker learns about the true nature of his reality.",
                popularity: 8.7,
                posterPath: "https://i.blogs.es/5b0845/stranger-things-2-poster-teaser-netflix/1366_2000.jpg",
                firstAirDate: "1999-03-31",
                name: "The Matrix",
                voteAverage: 8.7,
                voteCount: 1500),

        MovieUI(adult: false,
                backdropPath: "https://example.com/backdrop2.jpg",
                genreIds: [1, 3],
                id: 4,
                originCountry: ["USA"],
                originalLanguage: "en",
                originalName: "Inception",
                overview: "A thief who steals corporate secrets through the use of dream-sharing technology.",
                popularity: 8.8,
                posterPath: "https://i.blogs.es/5b0845/stranger-things-2-poster-teaser-netflix/1366_2000.jpg",
                firstAirDate: "2010-07-16",
                name: "Inception",
                voteAverage: 8.8,
                voteCount: 2000),

        MovieUI(adult: false,
                backdropPath: "https://example.com/backdrop1.jpg",
                genreIds: [1, 2],
                id: 5,
                originCountry: ["USA"],
                originalLanguage: "en",
                originalName: "The Matrix",
                overview: "A computer hacker learns about the true nature of his reality.",
                popularity: 8.7,
                posterPath: "https://i.blogs.es/5b0845/stranger-things-2-poster-teaser-netflix/1366_2000.jpg",
                firstAirDate: "1999-03-31",
                name: "The Matrix",
                voteAverage: 8.7,
                voteCount: 1500),

        MovieUI(adult: false,
                backdropPath: "https://example.com/backdrop2.jpg",
                genreIds: [1, 3],
                id: 6,
                originCountry: ["USA"],
                originalLanguage: "en",
                originalName: "Inception",
                overview: "A thief who steals corporate secrets through the use of dream-sharing technology.",
                popularity: 8.8,
                posterPath: "https://i.blogs.es/5b0845/stranger-things-2-poster-teaser-netflix/1366_2000.jpg",
                firstAirDate: "2010-07-16",
                name: "Inception",
                voteAverage: 8.8,
                voteCount: 2000),
    ]


    var body: some View {
    
        TabView(selection: $selectedIndex) {
 
            
            NavigationStack() {
               CommonDetailMovie(selectedCatalog: previewMovie, data: previewMokedMovies)
            }
            .tabItem {
                Text("Home view")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
            }
            .tag(0)
            
            NavigationStack() {
                Text("Profile view")
                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(1)
            
            NavigationStack() {
                Text("About view")
                    .navigationTitle("About")
                
            }
            .tabItem {
                Text("About view")
                Image(systemName: "info.circle")
            }
            .badge("12")
            .tag(2)
        }
        //1
        .tint(.pink)
        .onAppear(perform: {
            //2
            UITabBar.appearance().unselectedItemTintColor = .systemBrown
            //3
            UITabBarItem.appearance().badgeColor = .systemPink
            //4
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            //5
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]

        })
    }
}


#Preview {
    Details()
        .modelContainer(for: Item.self, inMemory: true)
}
