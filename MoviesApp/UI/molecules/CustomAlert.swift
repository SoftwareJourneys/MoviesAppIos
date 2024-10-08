//
//  DarkModeAlert.swift
//  MoviesApp
//
//  Created by Work on 8/10/24.
//

import Foundation
import SwiftUI

struct CustomAlert: View {
    @Binding var showAlert: Bool
    var title: String
    var message: String
    var confirmText: String
    
    var body: some View {
        if showAlert {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 10) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(message)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    Divider()
                        .background(Color.gray)
                    
                    Button(action: {
                        showAlert = false
                    }) {
                        Text(confirmText)
                            .background(Color.black)
                            .foregroundColor(.white)
                    }                }
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .frame(width: 250)
            }
        }
    }
}
