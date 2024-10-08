//
//  MoreScreen.swift
//  MoviesApp
//
//  Created by Work on 7/10/24.
//

import SwiftUI

struct MoreScreen: View {
    @State private var showProfile = false
    @State private var showSettings = false
    @State private var showAbout = false

    var body: some View {
        NavigationView {
            List {
                // Sección de perfil de usuario
                Section(header: Text("User Profile").foregroundColor(.white)) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        
                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("View Profile")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .onTapGesture {
                        showProfile = true
                    }
                }

                Section(header: Text("More Options").foregroundColor(.white)) {
                    Button(action: {
                        showSettings = true
                    }) {
                        HStack {
                            Image(systemName: "gear")
                                .foregroundColor(.blue)
                            Text("Settings")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button(action: {
                        showAbout = true
                    }) {
                        HStack {
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                            Text("About")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button(action: {
                        print("Help tapped")
                    }) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.blue)
                            Text("Help")
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button(action: {
                        print("Sign Out tapped")
                    }) {
                        HStack {
                            Image(systemName: "arrow.right.square")
                                .foregroundColor(.blue)
                            Text("Sign Out")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("More", displayMode: .inline)
            .background(Color.black)
        }
        .sheet(isPresented: $showProfile) {
            Text("Profile Screen")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .sheet(isPresented: $showSettings) {
            Text("Settings Screen")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
        .sheet(isPresented: $showAbout) {
            Text("About Screen")
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
    }
}
