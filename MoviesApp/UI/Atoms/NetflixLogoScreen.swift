//
//  NetflixLogoScreen.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct NetflixLogoScreen : View{
    
    var body: some View {
        VStack {
            Image("NetflixLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(.top, 40)
        }
        .frame(width: UIScreen.main.bounds.width, height: 300)
        .clipped()
        .alignmentGuide(.top) { _ in 0 }
    }
}
