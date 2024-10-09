//
//  MediaSponsorComposedIcon.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct MediaSponsorLabeledIcon : View {
    
    var iconName : String
    var title : String
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .foregroundColor(.white)
            Text(title)
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}
