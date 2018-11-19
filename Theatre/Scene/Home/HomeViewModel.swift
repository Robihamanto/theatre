//
//  HomeViewModel.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelInput {
    // Call when the bottom of the list is reached
    var loadMore: BehaviorSubject<Bool> { get }
}

protocol HomeViewModelOutput {
    //Emits an array of movies for the tableview
    var movies: Observable<[Movie]>! { get }
    
    //Emits a boolean when the pull-to-request is refreshing or not
    //var isRefreshing: Observable<Bool> { get }
    
    //Emits a category to request movie
    var collection: Observable<Collection>! { get }
    
    //Emits the child viewModel
    var homeViewCellModelTypes : Observable<[HomeViewCellModelType]> { get }
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
    var loadMore: BehaviorSubject<Bool>
    
    //MARK: - Output
    //var isRefreshing: Observable<Bool>
    var movies: Observable<[Movie]>!
    var collection: Observable<Collection>!
    
    lazy var homeViewCellModelTypes : Observable<[HomeViewCellModelType]> = {
        return movies.map { movies -> [HomeViewCellModel] in
            var homeViewCellModelArray = [HomeViewCellModel]()
            for movie in movies {
                let model = HomeViewCellModel(title: movie.title ?? "")
                homeViewCellModelArray.append(model)
            }
            return homeViewCellModelArray
        }
    }()
    
    
    //MARK: - Variable
    private let service: MovieServiceType
    private let refreshProperty = BehaviorSubject<Bool>(value: true)
    
    //MARK: - Private
    private let loadMoreProperty = BehaviorSubject<Bool>(value: true)
    private let collectionProperty = BehaviorSubject<Collection>(value: .upcoming)
    
    
    
    init(service: MovieServiceType = MovieService()) {
        self.service = service
        
        let page = BehaviorRelay<Int>(value: 1)
//        let movieArray = BehaviorRelay<[Movie]>(value: [])
        
        
        collection = collectionProperty.asObserver()
        loadMore = loadMoreProperty
        
        
        
        let firstRequest = Observable
        .combineLatest(collection, loadMore)
            .flatMapLatest { collection, loadMore -> Observable<[Movie]> in
                return service.fetchMovies(withCollection: collection, andPage: page.value)
        }
        
        movies = firstRequest
        
//        let nextPageAvailable = BehaviorRelay<Bool>(value: true)
//        let nextPageTrigger = self.loadMore.withLatestFrom(nextPageAvailable.asDriver())
//            .flatMapLatest { available -> Driver<Void> in
//                return available ? Driver.just(()) : Driver.empty()
//        }
        
//        let result = nextPageAvailable.withLatestFrom(page.asDriver())
//            .flatMapLatest { pageValue -> Driver<[Movie]> in
//                return self.service
//                    .fetchMovies(withCollection: Collection.upcoming)
//                    .asDriver(onErrorJustReturn: [])
//            }
//            .map { result -> [Movie] in
//                items.accept(items.value + result)
//                return items.value
//        }
    }
    
//    func transform(fromInput input: HomeViewModelInput) -> HomeViewModelOutput {
//        let page = BehaviorRelay<Int>(value: 0)
//        let items = BehaviorRelay<[Movie]>(value: [])
//        let nextPageAvailable = BehaviorRelay<Bool>(value: true)
//
//        let nextPageTrigger = loadMore.withLatestFrom(nextPageAvailable.asDriver())
//            .flatMapLatest { available -> Driver<Void> in
//                return available ? Driver.just(()) : Driver.empty()
//        }
//
//        let result = nextPageAvailable.withLatestFrom(page.asDriver())
//            .flatMapLatest { pageValue -> Driver<[Movie]> in
//                return self.service
//                .fetchMovies(withCollection: Collection.upcoming)
//                .asDriver(onErrorJustReturn: [])
//        }
//            .map { result -> [Movie] in
//                items.accept(items.value + result)
//                return items.value
//        }
//    }
}
