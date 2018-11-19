//
//  MovieServiceType.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieServiceType {
    func fetchMovies(withCollection collection: Collection,andPage page: Int) -> Observable<[Movie]>
}
