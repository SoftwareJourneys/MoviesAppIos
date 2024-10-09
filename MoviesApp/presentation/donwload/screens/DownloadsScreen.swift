//
//  DownloadsScreen.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import SwiftUI

struct DownloadsScreen: View {
    @EnvironmentObject var viewModel: MediaViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Downloads")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                let downloadedMovies = getDownloadedMovies()

                if downloadedMovies.isEmpty {
                    Spacer()
                    Text("No downloads available")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding()
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(downloadedMovies) { movie in
                            HStack {
                                AsyncImage(url: URL(string: movie.imageUrl)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 120)
                                        .cornerRadius(8)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 120)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(movie.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    ProgressView(value: movie.progress)
                                        .progressViewStyle(LinearProgressViewStyle())
                                        .accentColor(.blue)
                                        .frame(width: 150)
                                    
                                    Button(action: {
                                    }) {
                                        HStack {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                            Text("Delete")
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding()
                        }
                    }
                }
            }
            .background(Color.black)
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.getMedia()
        }
    }
    
    func getDownloadedMovies() -> [DownloadedMovie] {
        let movies = viewModel.topRatedMovies.prefix(3)
        
        return movies.map { movie in
            DownloadedMovie(title: movie.title, progress: Double.random(in: 0.5...1.0), imageUrl: movie.image)
        }
    }
}

struct DownloadedMovie: Identifiable {
    var id = UUID()
    var title: String
    var progress: Double
    var imageUrl: String
}
