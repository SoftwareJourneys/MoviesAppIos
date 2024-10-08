//
//  ContentView.swift
//  MoviesApp
//
//  Created by Work on 10/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var items: [Item]

    var body: some View {
        HomeBar()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
