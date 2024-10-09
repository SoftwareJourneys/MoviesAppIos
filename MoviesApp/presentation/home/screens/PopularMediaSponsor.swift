//
//  PopularMediaSponsor.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//
import SwiftUI

@MainActor
struct PopularMediaSponsor: View {
    @EnvironmentObject var viewModel: MediaViewModel
    @State private var showAlert = false
    var movie: MediaUI?

    var body: some View {
        ZStack {
            if let movie = movie, let image = URL(string: movie.image) {
                AsyncImage(url: image) { phase in
                    if viewModel.isConnected {
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 80, height: 80)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .clipped()
                                .alignmentGuide(.top) { _ in 0 }
                        case .failure:
                            NetflixLogoScreen()
                        @unknown default:
                            EmptyView()
                        }
                    } else {
                        NetflixLogoScreen()
                    }
                }
                .ignoresSafeArea()
            }

            VStack {
                HStack {
                    Image("NetflixLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("TV Shows")
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    Text("Movies")
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    Text("My List")
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding()

                Spacer()
                if let movie = movie {
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                        .accessibilityIdentifier("SponsorMovieTitle")
                } else {
                    Text("No title available")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }
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
                        showAlert = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showAlert = false
                        }
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
                    .accessibilityIdentifier("Play")
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
            .overlay(
                CustomAlert(
                    showAlert: $showAlert,
                    title: "Warning",
                    message: "No playable movie",
                    confirmText: "OK"
                )
            )
        }
    }
}
