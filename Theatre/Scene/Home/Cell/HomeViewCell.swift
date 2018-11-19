//
//  HomeViewCell.swift
//  Theatre
//
//  Created by Robihamanto on 18/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewCell: UITableViewCell, NibIdentifiable, ClassIdentifiable {
    
    static let identifier = "HomeViewCell"
    
    //MARK: - Outlets
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(withViewModel model: HomeViewCellModelType) {
        self.textLabel?.text = model.outputs.title
    }
    
    
}
