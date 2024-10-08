//
//  MoviesMenu.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation
import SwiftUI

struct MoviesMenu: View {
    var menuTitle: String
    var media: [MediaUI]
    var loadMoreAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(menuTitle)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(media) { movie in
                        MovieView(movie: movie)
                    }
                    if(!media.isEmpty){
                        Button(action: {
                            loadMoreAction()
                        }) {
                            Text("See more")
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(alignment: .topLeading)
        .padding()
    }
}
