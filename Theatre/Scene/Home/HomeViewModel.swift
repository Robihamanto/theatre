//
//  HomeViewModel.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeViewModelInput {
    /// Call when the bottom of the list is reached
    var loadMore: BehaviorSubject<Bool> { get }
}

protocol HomeViewModelOutput {
    //Emits an array of movies for the tableview
    var movies: Observable<[Movie]>! { get }
    
    //Emits a boolean when the pull-to-request is refreshing or not
    var isRefreshing: Observable<Bool> { get }
    
}

protocol HomeViewModelType {
    var inputs: HomeViewModelInput { get }
    var outputs: HomeViewModelOutput { get }
}


final class HomeViewModel : HomeViewModelType,
                            HomeViewModelInput,
                            HomeViewModelOutput {
    
    //MARK: - Input & Output
    var inputs: HomeViewModelInput { return self }
    var outputs: HomeViewModelOutput { return self }
    
    //MARK: - Input
    
    var loadMore = BehaviorSubject<Bool>(value: false)
    
    //MARK: - Output
    var movies: Observable<[Movie]>!
    var isRefreshing: Observable<Bool>
    
    //MARK: - Variable
    private let service: MovieServiceType
    private let refreshProperty = BehaviorSubject<Bool>(value: true)
    
    init(service: MovieServiceType = MovieService()) {
        self.service = service
        self.isRefreshing = refreshProperty.asObservable()
        service.fetchPhotos(withCollection: .upcoming) { (movies, status) in
            if status == true {
                self.movies = Observable.from(optional: movies)
            }
        }
    }
    
}
