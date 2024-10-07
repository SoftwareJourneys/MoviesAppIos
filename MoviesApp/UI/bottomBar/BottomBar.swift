import Foundation
import SwiftUI


@MainActor
struct HomeBar: View {
    var body: some View {
        TabView {
            homeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            searchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            comingSoonView()
                .tabItem {
                    Label("Coming Soon", systemImage: "clock")
                }
            
            downloadsView()
                .tabItem {
                    Label("Downloads", systemImage: "arrow.down.circle")
                }
            
            moreView()
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
        }
        .accentColor(.white)
    }
}
