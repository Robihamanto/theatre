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
    func fetchPhotos(withCollection collection: Collection, completion: @escaping(([Movie], Bool) -> ()))
    func fetchPhotos(withCollection collection: Collection) -> Observable<[Movie]>
}
