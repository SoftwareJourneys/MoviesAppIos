//
//  ComingSoonScreen.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import SwiftUI

struct ComingSoonScreen: View {
    var title: String = "Coming Soon"
    var description: String = "Get ready for upcoming movies and series!"
    var releaseDate: String = "Releasing: October 20, 2024"
    var imageUrl: String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRersIt-xXcLtzEfKtmAYURYXOaUCHRXr5SHQ&s"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .bold()
                .padding(.horizontal)
            
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 250)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 250)
            }
            .padding(.horizontal)
            
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Text(releaseDate)
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 10)
            Button(action: {
                print("Reminder added for \(title)")
            }) {
                HStack {
                    Image(systemName: "bell")
                        .foregroundColor(.white)
                    Text("Remind Me")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .background(Color.black)
        .cornerRadius(12)
        .padding()
    }
}
