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
                    MediaCategoryStaticText(title: "TV Shows")
                    MediaCategoryStaticText(title: "Movies")
                    MediaCategoryStaticText(title: "My List")
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding()

                Spacer()
                if let movie = movie {
                    SponsorMovieTitle(title: movie.title)
                        .accessibilityIdentifier("SponsorMovieTitle")
                } else {
                    SponsorMovieTitle(title: "No title available")
                }
                Text("TV shows")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                HStack(spacing: 40) {
                    MediaSponsorLabeledIcon(iconName: "checkmark", title: "My List")
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
                    MediaSponsorLabeledIcon(iconName: "info.circle", title: "Info")
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
