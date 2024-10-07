//
//  DownloadsScreen.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import Foundation
import SwiftUI

struct DownloadsScreen: View {
    @State private var movieName: String = ""

    var body: some View {
        VStack {
            TextField("Ingresa el nombre de la película", text: $movieName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                print("Buscar película: \(movieName)")
            }) {
                Text("Buscar")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}
