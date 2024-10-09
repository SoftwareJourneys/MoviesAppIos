//
//  HeaderMenuTitle.swift
//  MoviesApp
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI

struct HeaderMenuTitle: View {
    var menuTitle: String

    var body: some View {
        HStack {
            Text(menuTitle)
                .bold()
                .font(.title2)
                .foregroundColor(.white)
                .accessibilityIdentifier("MenuTitle")
            Spacer()
        }
    }
}
