//
//  MediaUI.swift
//  MoviesApp
//
//  Created by Work on 10/7/24.
//

import Foundation

struct MediaUI: Identifiable, Hashable {
    var id: Int  = 1
    var image: String
    var title: String
    var rating: String
    var date: String
    var isFavorite: Bool = false
}
