//
//  MockedData.swift
//  MoviesAppUITests
//
//  Created by Work on 9/10/24.
//

import Foundation
import SwiftUI
@testable import MoviesApp

class MockMediaUI {
    
    struct MockedMediaUI {
        var id: Int  = 1
        var image: String
        var title: String
        var rating: String
        var date: String
        var isFavorite: Bool = false
    }
    
    static func mapMediaUI(from original: MockedMediaUI) -> MediaUI {
        return MediaUI(
            id: original.id,
            image: original.image,
            title: original.title,
            rating: original.rating,
            date: original.date,
            isFavorite: original.isFavorite
        )
    }
    
    static let testMovie = MockedMediaUI(
        image: "https://example.com/testimage.jpg",
        title: "Test Movie",
        rating: "5.0",
        date: "2024-01-01"
    )
}
