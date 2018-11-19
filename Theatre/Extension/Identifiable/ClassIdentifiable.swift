//
//  ClassIdentifiable.swift
//  Theatre
//
//  Created by Robihamanto on 18/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation

protocol ClassIdentifiable {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    static var reuseId: String {
        return String(describing: self)
    }
}
