//
//  MovieContainer.swift
//  MoviesApp
//
//  Created by Work on 8/10/24.
//
import Foundation
import SwiftUI

struct MovieContainer: View{
    @State private var selectedOption: String = CompanionStrings.OPTION1
    var data:[MediaUI]
    
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
    
    var chapterMetaData:MediaUI
    var option: String
    
    var body:some View{
        VStack {
            if(option.elementsEqual(CompanionStrings.OPTION1)){
                URLImageViewMovie(urlString: chapterMetaData.image)
                
                Text(chapterMetaData.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(chapterMetaData.title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(chapterMetaData.title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                    .padding()
            }else if(option.elementsEqual(CompanionStrings.OPTION2)){
                URLImageViewMovie(urlString: chapterMetaData.image)
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

