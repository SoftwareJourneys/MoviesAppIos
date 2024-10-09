//
//  MockedData.swift
//  MoviesAppUITests
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI
@testable import MoviesApp

class MockedData {
    static let testMovie = MediaUI(
        image: "https://example.com/testimage.jpg",
        title: "Test Movie",
        rating: "5.0",
        date: "2024-01-01")
}

struct MediaUI: Identifiable, Hashable {
    var id: Int  = 1
    var image: String
    var title: String
    var rating: String
    var date: String
    var isFavorite: Bool = false
}
