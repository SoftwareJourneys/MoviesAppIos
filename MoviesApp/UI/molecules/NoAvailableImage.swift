//
//  NoAvailableImage.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import SwiftUI

struct NoAvailableImageView: View {
    var body: some View {
        ZStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 70)
                .foregroundColor(.gray)

            Image(systemName: "xmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.red)
                .offset(x: 35, y: -30)
        }
        .frame(width: 100, height: 100)
    }
}
