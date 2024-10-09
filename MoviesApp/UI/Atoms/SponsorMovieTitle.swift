//
//  SponsorMovieTitle.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct SponsorMovieTitle : View {
    
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding(.bottom, 5)
        }
    }
}
