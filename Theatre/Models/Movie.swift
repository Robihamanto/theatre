//
//  Movie.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]?
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results = "result"
        case page
        case totalResults = "total_result"
        case totalPages = "total_pages"
    }
}

struct Movie: Codable {
    let voteCount: Int?
    let id: Int?
    let video: Bool?
    let voteAverage: Double?
    let popularity: Double?
    let posterPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let gendreIds: [Int]?
    let backdropPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: Bool?
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id
        case video
        case voteAverage = "vote_average"
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case gendreIds = "gendre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate
    }
}
