//
//  UITableView+Extension.swift
//  Theatre
//
//  Created by Robihamanto on 17/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension UIScrollView {
    public var rx_reachedBottom: Observable<Void> {
        return rx.contentOffset
            .debounce(0.025, scheduler: MainScheduler.instance)
            .flatMap { [weak self] contentOffset -> Observable<Void> in
                guard let scrollView = self else {
                    return Observable.empty()
                }
                
                let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
                let y = contentOffset.y + scrollView.contentInset.top
                let threshold = max(0.0, scrollView.contentSize.height - visibleHeight)
                
                return y >= threshold ? Observable.just(()) : Observable.empty()
        }
    }
}

extension UITableView {
    var rx_bottomReached: Observable<Void> {
        return self.rx.contentOffset
            .flatMapLatest({ [unowned self] offset -> Observable<Void> in
                let shouldTrigger = offset.y + self.frame.size.height + 40 > self.contentSize.height
                return shouldTrigger ? Observable.just(()) : Observable.empty()
            })
    }
}

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) where T: ClassIdentifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseId)
    }
    
    func register<T: UITableViewCell>(cellType: T.Type) where T: NibIdentifiable & ClassIdentifiable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseId)
    }
}
