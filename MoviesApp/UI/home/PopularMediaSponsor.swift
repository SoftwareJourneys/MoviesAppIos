//
//  PopularMediaSponsor.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import SwiftUI

@MainActor
struct PopularMediaSponsor: View {
    
    var movie: MediaUI?
    
    var body: some View {
        ZStack {
            if let movie = movie {
                AsyncImage(url: URL(string: movie.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .clipped()
                        .alignmentGuide(.top) { _ in 0 }
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                }
                .ignoresSafeArea()

                VStack {
                    HStack {
                        AsyncImage(url: URL(string: "https://loodibee.com/wp-content/uploads/Netflix-N-Symbol-logo.png")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 40, height: 40)
                        }

                        Text("TV Shows")
                            .foregroundColor(.white)

                        Text("Movies")
                            .foregroundColor(.white)

                        Text("My List")
                            .foregroundColor(.white)
                    }
                    .padding()

                    Spacer()

                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

                    Text("TV shows")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    HStack(spacing: 40) {
                        VStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                            Text("My List")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            // Acción del botón "Play"
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.black)
                                Text("Play")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .cornerRadius(5)
                        }
                        VStack {
                            Image(systemName: "info.circle")
                                .foregroundColor(.white)
                            Text("Info")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea(edges: .bottom)
            } else {
                // Manejo del caso en que movie es nil
                VStack {
                    Text("No movie data available")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .ignoresSafeArea()
            }
        }
    }
}
