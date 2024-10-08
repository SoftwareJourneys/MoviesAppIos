//
//  ContentView.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var mediaViewModel = MediaViewModel()
    
    var body: some View {

        ZStack {
            HomeBar()
                .preferredColorScheme(.dark)
            
            VStack {
                OfflineMessage()
                Spacer()
                ErrorMessage()
            }
        }
        .environmentObject(mediaViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
