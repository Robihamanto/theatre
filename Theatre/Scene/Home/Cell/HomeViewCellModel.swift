//
//  HomeViewCellModel.swift
//  Theatre
//
//  Created by Robihamanto on 18/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeViewCellModelOutput {
    var title: String! { get }
}

protocol HomeViewCellModelType {
    var outputs: HomeViewCellModelOutput { get }
}

class HomeViewCellModel: HomeViewCellModelType, HomeViewCellModelOutput {
    
    //MARK: - Input & Output
    var outputs: HomeViewCellModelOutput { return self }
    
    //MARK: - Output
    var title: String!
    
    init(title: String) {
        self.title = title
    }
}



