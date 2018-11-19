//
//  MovieService.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Unbox

struct MovieService: MovieServiceType {
    
    private var provider: MoyaProvider<Theatre>
    
    init (provider: MoyaProvider<Theatre> = MoyaProvider<Theatre>(plugins: [NetworkLoggerPlugin(verbose: true)])) {
        self.provider = provider
    }
    
    func fetchMovies(withCollection collection: Collection, andPage page: Int) -> Observable<[Movie]> {
        return provider.rx.request(.movies(collection: collection.string, page: page))
        .asObservable()
        .filterSuccessfulStatusAndRedirectCodes()
        .mapJSON()
        .map { json -> [Movie] in
            let dictionary = json as! [String:Any]
            let movies: [Movie] = try unbox(dictionary: dictionary, atKey: "results")
            return movies
        }
    }
}
