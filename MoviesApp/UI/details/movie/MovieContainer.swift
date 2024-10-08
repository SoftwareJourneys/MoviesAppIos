
import Foundation
import SwiftUI

struct MovieContainer: View{
    
    @State private var selectedOption: String = CompanionStrings.OPTION1
    
    var data:[MovieUI]
    
    var body:some View{
        VStack {
            HStack {
                        Button(action: {
                            selectedOption = CompanionStrings.OPTION1
                        }) {
                            Text(CompanionStrings.MENU_TRAILERS)
                                .padding()
                                .foregroundColor(selectedOption == CompanionStrings.OPTION1 ? .blue : .gray)
                                .background(selectedOption == CompanionStrings.OPTION1 ? Color.blue.opacity(0.2) : Color.clear)
                                .cornerRadius(8)
                                .font(.system(size: 12))
                        }

                        Button(action: {
                            selectedOption = CompanionStrings.OPTION2
                        }) {
                            Text(CompanionStrings.MENU_MORE_LIKE_THIS)
                                .padding()
                                .foregroundColor(selectedOption == CompanionStrings.OPTION2 ? .blue : .gray)
                                .background(selectedOption == CompanionStrings.OPTION2 ? Color.blue.opacity(0.2) : Color.clear)
                                .cornerRadius(8)
                                .font(.system(size: 12))
                        }
                    }
                    .padding()

                    Spacer()
            
            
            if selectedOption == CompanionStrings.OPTION1 {
                        CommonTrailer(videoURL: URL(string: "https://www.youtube.com/watch?v=CpXJHWSXJW0")!)
                    
                    } else if selectedOption == CompanionStrings.OPTION2 {
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
            
            }
    }





struct Movie: View{
    
    var chapterMetaData:MovieUI
    var option: String
    
    var body:some View{
        VStack {
            if(option.elementsEqual(CompanionStrings.OPTION1)){
                URLImageViewMovie(urlString: chapterMetaData.posterPath)
                
                Text(chapterMetaData.originalName)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(chapterMetaData.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(chapterMetaData.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                    .padding()
            }else if(option.elementsEqual(CompanionStrings.OPTION2)){
                URLImageViewMovie(urlString: chapterMetaData.posterPath)
            }
        }
    }
}



struct URLImageViewMovie: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
        } placeholder: {
            ProgressView()
        }
    }
}

struct ContentView_Previews3: PreviewProvider {

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
        MovieContainer(data: movies)
    }
}
