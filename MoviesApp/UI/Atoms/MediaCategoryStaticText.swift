//
//  MediaCategoryStaticText.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct MediaCategoryStaticText : View {
    
    var title: String
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .padding(.leading, 30)
    }
}
