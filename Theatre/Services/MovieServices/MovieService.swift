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
    
    func fetchPhotos(withCollection collection: Collection) -> Observable<[Movie]> {
        return provider.rx.request(.movies(collection: collection.string))
        .asObservable()
        .filterSuccessfulStatusAndRedirectCodes()
        .mapJSON()
        .map { json -> [Movie] in
            let dictionary = json as! [String:Any]
            let movies: [Movie] = try unbox(dictionary: dictionary, atKey: "results")
            return movies
        }
    }
    
    
    
    
    
    
    func fetchPhotos(withCollection collection: Collection, completion: @escaping ([Movie], Bool) -> ()) {

        let movies: Theatre = .movies(collection: "upcoming")

        provider.request(movies) { (result) in
            switch result {
            case .success(let response):
                guard let data = try? JSONDecoder().decode( MovieResponse.self, from: response.data) as MovieResponse else {
                    completion([], false)
                    return
                }
                completion(data.results ?? [], true)
            case .failure(let error):
                completion([], false)
                print(error.errorDescription ?? "")
            }
        }
    }
    
}
