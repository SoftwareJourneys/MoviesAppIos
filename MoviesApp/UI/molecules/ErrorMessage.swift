//
//  ErrorMessage.swift
//  MoviesApp
//
//  Created by Work on 8/10/24.
//

import Foundation
import SwiftUI

struct ErrorMessage: View {
    @EnvironmentObject var viewModel: MediaViewModel

    var body: some View {
        VStack {
            if let message = viewModel.errorMessage {
                Text(message)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                viewModel.clearErrorMessage()
                            }
                        }
                    }
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .opacity))
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: viewModel.errorMessage)
        .padding()
    }
}
