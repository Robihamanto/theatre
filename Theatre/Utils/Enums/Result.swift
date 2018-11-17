//
//  Result.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation

public enum Result<T, E> {
    case success(T)
    case error(E)
}
