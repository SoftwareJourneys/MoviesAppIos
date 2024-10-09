//
//  MovieImageViewOnline.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct MovieImageViewOnline: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 160)
            .clipShape(Rectangle())
            .accessibilityIdentifier("MovieImage")
    }
}
