import Foundation
import SwiftUI

struct CommonDetailMovie: View{
    
    // Data. selected movie/serie
    var selectedCatalog:MovieUI
    // Data. other movies to show on bottonm section
    var data:[MovieUI]

        
    var body: some View {
        
        ZStack{
            
            URLBackGroundImage(urlString: selectedCatalog.posterPath)
                           
            
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.black.opacity(1.9)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
        
            ScrollView{
                
                let _columns = Array(repeating: GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 10), count: 3)
                // imagen
                URLImageView(urlString: selectedCatalog.posterPath)
                // info hstack
                HStack(){
                    Text(String(selectedCatalog.popularity) + "% Popular").fontWeight(.bold).foregroundStyle(.green)
                    
                    Text(String(selectedCatalog.firstAirDate).prefix(4)).foregroundStyle(.white)
                   
                    Text(String(selectedCatalog.voteCount)).foregroundStyle(.white)
                  
                    Text(selectedCatalog.originCountry?.first ?? "Desconocido").foregroundStyle(.white)
                }
                // butonsHstack
                HStack(){
                    IconButton(text: "Play", color: .gray, iconName: "play.fill", vstack:false, widthButton: 25.0, heightButton: 25.0)
                    IconButton(text: "Download", color: .gray, iconName: "arrow.down", vstack: false,widthButton: 25.0, heightButton: 25.0)

                }
                // text desc
                ShowMoreTextView(selectedCatalog: selectedCatalog).padding(50)
                
                Divider()
                    .frame(height: 2)
                    .background(Color.gray)
                
                
                if Bool.random(){
                    SerieContainer(data: data)
                }else{
                    MovieContainer(data: data)
                }
            }
        }
    }

struct IconButton: View {
    var text:String
    var color:Color
    var iconName:String
    var vstack:Bool
    var widthButton:Double
    var heightButton:Double
    
    var body: some View {
        if(vstack){
            VStack(alignment: .center) {
                
                Button(action: {
                    // Acción del botón
                }) {
                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                        .foregroundColor(color)
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(Color.gray)
                
                Text(text)
                    .foregroundColor(color)
            }
            .padding() // Añadir padding para que el fondo se vea mejor
            .background(Color.white) // Establecer el fondo blanco
            .cornerRadius(8) // Bordes redondeados opcionales
            .shadow(radius: 2) // Sombra opcional
            
        
    
        }else{
            HStack (alignment: .center){
                        Button(action: {
                            // Acción del botón
                        }) {
                            Image(systemName: iconName)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.black)
                                .frame(width: widthButton, height: heightButton)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(Color.gray)

                        Text(text)
                            .foregroundColor(color)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                
        }
    }
    }
}


struct URLImageView: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        } placeholder: {
            ProgressView()
        }
    }
}
          

struct ShowMoreTextView: View {
    @State private var isExpanded = false
    let selectedCatalog:MovieUI
    
    var body: some View {
        VStack{
            Text(selectedCatalog.originalName)
                .padding(.bottom,0)
                .foregroundStyle(.white)
            
            if isExpanded {
                
                Text(selectedCatalog.overview)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    
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
                

struct URLBackGroundImage: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFill()
                .clipped()
        } placeholder: {
            ProgressView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {

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
                    posterPath: "https://i.blogs.es/5b0845/stranger-things-2-poster-teaser-netflix/1366_2000.jpg",
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
                    posterPath: "https://i.blogs.es/5b0845/stranger-things-2-poster-teaser-netflix/1366_2000.jpg",
                    firstAirDate: "2010-07-16",
                    name: "Inception",
                    voteAverage: 8.8,
                    voteCount: 2000),

        ]
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
        CommonDetailMovie(selectedCatalog: previewMovie, data: movies)
    }
}
