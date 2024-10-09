//
//  MovieImageViewOffline.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct MediaImageViewOffline : View {
    
    var title : String
    var body : some View {
        VStack {
            NoAvailableImageView()
            MovieTitleViewOffline(title : title)
        }
    }
}
