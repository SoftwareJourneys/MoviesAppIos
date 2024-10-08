//
//  DetailedView.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import SwiftUI
import Foundation

struct DetailedView: View {
    
    @State private var selectedIndex: Int = 0
    @StateObject private var viewModel = MediaViewModel()
    let previewMovieId:Int
    @State private var selectedCatalog: MediaUI?

    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack() {
                if let catalog = selectedCatalog {
                        CommonDetailMovie(selectedCatalog: catalog)
                } else {
                        Text("Loading...")
                }
            }
            .tabItem {
                Text("Home view")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
            }
            .tag(0)
            
            NavigationStack() {
                Text("Profile view")
                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(1)
            
            NavigationStack() {
                Text("About view")
                    .navigationTitle("About")
                
            }
            .tabItem {
                Text("About view")
                Image(systemName: "info.circle")
            }
            .badge("12")
            .tag(2)
        }
        //1
        .tint(.pink)
        .onAppear {
            Task {
                do {
                    selectedCatalog = try await viewModel.mediaRepository.getMovieById(id: previewMovieId)
                } catch {
                    print("Error on getting data: \(error)")
                }
            }
        }
        .onAppear(perform: {
            
            //2
            UITabBar.appearance().unselectedItemTintColor = .systemBrown
            //3
            UITabBarItem.appearance().badgeColor = .systemPink
            //4
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            //5
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
            	
        })
    }
    
}
