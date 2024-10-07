//
//  DetailedView.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import Foundation
import SwiftUI

struct DetailedView: View {
    var movieTitle : String

    var body: some View {
        NavigationView{
            Text("Detailed View for \(movieTitle)")
                .font(.largeTitle)
                .padding()
        }
    }
}
