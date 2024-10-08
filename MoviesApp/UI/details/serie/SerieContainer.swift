
import Foundation
import SwiftUI

struct SerieContainer: View{
    
    @State private var selectedOption: String = CompanionStrings.OPTION1
    
    var data:[MovieUI]
    
    var body:some View{
        VStack {
            // Menú en la parte superior
            HStack {
                Button(action: {
                    selectedOption = CompanionStrings.OPTION1
                }) {
                    Text(CompanionStrings.MENU_EPISODES)
                        .padding()
                        .foregroundColor(selectedOption == CompanionStrings.OPTION1 ? .blue : .gray)
                        .background(selectedOption == CompanionStrings.OPTION1 ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                        .font(.system(size: 12))
                }
                
                Button(action: {
                    selectedOption = CompanionStrings.OPTION2
                }) {
                    Text(CompanionStrings.MENU_TRAILERS)
                        .padding()
                        .foregroundColor(selectedOption == CompanionStrings.OPTION2 ? .blue : .gray)
                        .background(selectedOption == CompanionStrings.OPTION2 ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                        .font(.system(size: 12))
                }
                
                Button(action: {
                    selectedOption = CompanionStrings.OPTION3
                }) {
                    Text(CompanionStrings.MENU_MORE_LIKE_THIS)
                        .padding()
                        .foregroundColor(selectedOption == CompanionStrings.OPTION3 ? .blue : .gray)
                        .background(selectedOption == CompanionStrings.OPTION3 ? Color.blue.opacity(0.2) : Color.clear)
                        .cornerRadius(8)
                        .font(.system(size: 12))
                }
            }
            .padding()
        
            Spacer()
            
            if selectedOption == CompanionStrings.OPTION1 {
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 1), spacing: 0) {
                        ForEach(data) { movie in
                            Serie(chapterMetaData: movie, option: CompanionStrings.OPTION1)
                        }
                    }
                    .padding()
                    
                }
                
            } else if selectedOption == CompanionStrings.OPTION2 {
                CommonTrailer(videoURL: URL(string: "https://www.youtube.com/watch?v=CpXJHWSXJW0")!)
            } else if selectedOption == CompanionStrings.OPTION3 {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 0), count: 3), spacing: 0) {
                        ForEach(data) { movie in
                            Movie(chapterMetaData: movie, option: CompanionStrings.OPTION2)
                        }
                    }
                    .frame(width: .infinity, height: .infinity)
                }
            }
            Spacer()
        }
    
        
        .navigationBarTitleDisplayMode(.large)
    }
}


struct Serie: View{
    var chapterMetaData:MovieUI
    var option: String
    
    var body:some View{
        if(option.elementsEqual("Opción 1")){
            HStack() {
                URLImageViewSerie(urlString: chapterMetaData.posterPath)
                    
                VStack{
                    
                    Text(chapterMetaData.originalName)
                        .font(.headline)
                        .foregroundColor(.primary)
                    	
                    Text(chapterMetaData.firstAirDate)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    
                    
                    ShowMoreTextViewChapter(selectedCatalog: chapterMetaData)
                }
                
            }
            .background(RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
            .padding()
        }else if(option.elementsEqual("Opción 3")){
            URLImageViewSerie(urlString: chapterMetaData.posterPath)
        }
    }
}


struct URLImageViewSerie: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.leading, 20)
                } placeholder: {
                    ProgressView()
                }
    }
}

struct ShowMoreTextViewChapter: View {
    @State private var isExpanded = true
    let selectedCatalog:MovieUI
    
    var body: some View {
        VStack{
            if isExpanded {
                Text(selectedCatalog.overview)
                    .lineLimit(3)
                    .foregroundColor(.gray)
                    
            }
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                Text(isExpanded ? "Show Less" : "Show More")
                    .foregroundColor(.gray)
            }
        }
        
    }
}

struct ContentView_Previews2: PreviewProvider {
    
    static var previews: some View {
        let movies: [MovieUI] = [
            MovieUI(adult: false,
                    backdropPath: "https://example.com/backdrop1.jpg",
                    genreIds: [1, 2],
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
                    genreIds: [1, 3],
                    id: 2,
                    originCountry: ["USA"],
                    originalLanguage: "en",
                    originalName: "Inception",
                    overview: "A thief who steals corporate secrets through the use of dream-sharing technology.",
                    popularity: 8.8,
                    posterPath: "https://m.media-amazon.com/images/I/71PfZFFz9yL._AC_SL1000_.jpg",
                    firstAirDate: "2010-07-16",
                    name: "Inception",
                    voteAverage: 8.8,
                    voteCount: 2000),
            
        ]
        SerieContainer(data: movies)
    }
}
