//
//  MovieTitleViewOffline.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct MovieTitleViewOffline: View {
    
    var title: String
    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(.white)
            .lineLimit(1)
            .truncationMode(.tail)
            .frame(width: 100)
    }
}
