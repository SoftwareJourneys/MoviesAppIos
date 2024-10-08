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
    @EnvironmentObject var viewModel: MediaViewModel
    let previewMovieId:Int
    let isSerie:Bool
    @State private var selectedCatalog: MediaUI?

    var body: some View {
            NavigationStack() {
                if let catalog = selectedCatalog {
                    CommonDetailMovie(selectedCatalog: catalog, isSerie: isSerie)
                } else {
                        Text("Loading...")
                }
            }
            .tint(.pink)
            .onAppear {
                Task {
                    do {
                        if isSerie{
                            selectedCatalog = try await viewModel.getSerieById(id: previewMovieId)
                        }else{
                            selectedCatalog = try await viewModel.getMovieById(id: previewMovieId)
                        }
                    } catch {
                        print("Error on getting data: \(error)")
                    }
                }
            }
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .systemBrown
            UITabBarItem.appearance().badgeColor = .systemPink
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
        })
    }
    
}
