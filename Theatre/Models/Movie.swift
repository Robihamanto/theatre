//
//  Movie.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import Unbox

//struct MovieResponse: Codable {
//    let results: [Movie]?
//    let page: Int?
//    let totalResults: Int?
//    let totalPages: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case results = "result"
//        case page
//        case totalResults = "total_result"
//        case totalPages = "total_pages"
//    }
//}

struct Movie {
    var voteCount           : Int?
    var id                  : Int?
    var video               : Bool?
    var voteAverage         : Double?
    var title               : String?
    var popularity          : Double?
    var posterPath          : String?
    var originalLanguage    : String?
    var originalTitle       : String?
    var gendreIds           : [Int]?
    var backdropPath        : String?
    var adult               : Bool?
    var overview            : String?
    var releaseDate         : Bool?
}

extension Movie: Unboxable {
    init(unboxer: Unboxer) throws {
        self.voteCount          = unboxer.unbox(key: "vote_count")
        self.id                 = unboxer.unbox(key: "id")
        self.video              = unboxer.unbox(key: "video")
        self.voteAverage        = unboxer.unbox(key: "vote_average")
        self.title              = unboxer.unbox(key: "title")
        self.popularity         = unboxer.unbox(key: "popularity")
        self.posterPath         = unboxer.unbox(key: "poster_path")
        self.originalLanguage   = unboxer.unbox(key: "original_language")
        self.originalTitle      = unboxer.unbox(key: "original_title")
        self.gendreIds          = unboxer.unbox(key: "gendre_ids")
        self.backdropPath       = unboxer.unbox(key: "backdrop_path")
        self.adult              = unboxer.unbox(key: "adult")
        self.overview           = unboxer.unbox(key: "overview")
        self.releaseDate        = unboxer.unbox(key: "release_date")
    }
}
