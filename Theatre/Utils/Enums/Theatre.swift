//
//  Theatre.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import Moya

enum Theatre {
    // fetch list of photo
    case movies(
        collection: String, page: Int)
}

extension Theatre: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3") else {
            fatalError("FAILED: https://api.themoviedb.org/3")
        }
        return url
    }
    
    var path: String {
        switch self {
        case let .movies(param):
            return "/movie/\(param.collection)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .movies(param):
            var params: [String: Any] = [:]
            params["api_key"] = "da209a7103025d781fc585c70b0816fb"
            params["page"] = "\(param.page)"
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)

        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
