//
//  Collection.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation

enum Collection {
    case nowPlaying
    case topRated
    case upcoming
    
    var string: String {
        switch self {
        case .nowPlaying:
            return "now_playing"
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        }
    }
}
