//
//  NibIdentifiable.swift
//  Theatre
//
//  Created by Robihamanto on 18/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import UIKit

protocol NibIdentifiable: class {
    static var nib: UINib { get }
}

extension NibIdentifiable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension NibIdentifiable where Self: UIView {
    static func initFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else { fatalError("Could't find nib file for \(self)") }
        return view
    }
}

extension NibIdentifiable where Self: UIViewController {
    static func initFromNib() -> Self {
        return Self(nibName: nibIdentifier, bundle: nil)
    }
}

extension UIViewController: NibIdentifiable {
    static var nibIdentifier: String {
        return String(describing: self)
    }
}
