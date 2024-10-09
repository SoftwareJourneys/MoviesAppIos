//
//  CommonDetailMovie.swift
//  MoviesApp
//
//  Created by Work on 8/10/24.
//

import Foundation
import SwiftUI

struct CommonDetailMovie: View{
    var selectedCatalog:MediaUI
    var data:[MediaUI] = []
    let isSerie:Bool

    var body: some View {
        
        ZStack{
            
            URLBackGroundImage(urlString: selectedCatalog.image)
                           
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.black.opacity(1.9)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
        
            ScrollView{
                let _columns = Array(repeating: GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 10), count: 3)
                URLImageView(urlString: selectedCatalog.image)
                HStack(){
                    Text(String(selectedCatalog.rating) + "% Popular").fontWeight(.bold).foregroundStyle(.green)
                        .accessibilityIdentifier("CommonDetailMovieView")
                    
                    Text(String(selectedCatalog.date).prefix(4)).foregroundStyle(.white)
                   
                    Text(String(selectedCatalog.rating)).foregroundStyle(.white)
                }
                HStack(){
                    IconButton(text: "Play", color: .gray, iconName: "play.fill", vstack:false, widthButton: 25.0, heightButton: 25.0)
                    IconButton(text: "Download", color: .gray, iconName: "arrow.down", vstack: false,widthButton: 25.0, heightButton: 25.0)

                }
                ShowMoreTextView(selectedCatalog: selectedCatalog).padding(50)
                
                Divider()
                    .frame(height: 2)
                    .background(Color.gray)
                
                
                
                if (self.isSerie){
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
    @State private var toastMessage = ""
    
    var body: some View {
        if(vstack){
            VStack(alignment: .center) {
                
                Button(action: {
        
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
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
            
        
    
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
    let selectedCatalog:MediaUI
    
    var body: some View {
        VStack{
            Text(selectedCatalog.title)
                .padding(.bottom,0)
                .foregroundStyle(.white)
            
            if isExpanded {
                
                Text(selectedCatalog.title)
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
