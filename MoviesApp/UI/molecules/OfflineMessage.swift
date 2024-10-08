//
//  OfflineMessage.swift
//  MoviesApp
//
//  Created by Work on 10/8/24.
//

import Foundation
import SwiftUI

struct OfflineMessage: View {
    @EnvironmentObject var viewModel: MediaViewModel

    var body: some View {
        VStack {
            if !viewModel.isConnected {
                Text("Offline Mode, may not load images")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                    .font(.caption)
            }
        }
        .animation(.default, value: viewModel.isConnected)
        .transition(.move(edge: .top))
    }
}
