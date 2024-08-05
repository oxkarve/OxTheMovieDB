//
//  Movie.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation

struct Movie: Codable {
    
    let title: String
    let overview: String
    let movieId: Int
    let voteAverage: Double
    let posterPath: String
    let backdropPath: String
    let releaseDate: String
    
    init() {
        self.title = ""
        self.overview = ""
        self.movieId = 0
        self.voteAverage = 0.0
        self.posterPath = ""
        self.backdropPath = ""
        self.releaseDate = ""
    }
    
    enum CodingKeys: String, CodingKey {
    
        case title = "title"
        case overview
        case movieId = "id"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}

struct ResultMovie: Codable {
    let results: Movie
}
