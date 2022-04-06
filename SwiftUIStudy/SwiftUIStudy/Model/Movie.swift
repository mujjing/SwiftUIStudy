//
//  Movie.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2022/04/06.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}

var movies: [Movie] = [
    Movie(movieTitle: "Ad Astra", artwork: "Movie1"),
    Movie(movieTitle: "Star Wars", artwork: "Movie2"),
    Movie(movieTitle: "Toys Story", artwork: "Movie3"),
    Movie(movieTitle: "Lion King", artwork: "Movie4"),
    Movie(movieTitle: "Spider Man No wat home", artwork: "Movie5"),
    Movie(movieTitle: "Shang Chi", artwork: "Movie6"),
    Movie(movieTitle: "Hawkeye", artwork: "Movie7")
]
