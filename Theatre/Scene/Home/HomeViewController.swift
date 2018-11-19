//
//  HomeViewController.swift
//  Theatre
//
//  Created by Robihamanto on 09/11/18.
//  Copyright © 2018 Robihamanto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var changeCollectionButton: UIButton!
    
    private var viewModel: HomeViewModelType!
    private let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindViewModel()
    }
    
    func bindViewModel () {
        //let inputs = viewModel.inputs
        viewModel = HomeViewModel()
        let output = viewModel.outputs
        
        output.collection.subscribe { collection in
            guard let collection = collection.element else { return }
            switch collection {
            case .nowPlaying :
                print(collection.string)
            case .topRated :
                print(collection.string)
            case .upcoming :
                print(collection.string)
            }
        }.disposed(by: disposeBag)
        
        output.homeViewCellModelTypes
        .map { $0 }
        .bind(to: tableView.rx.items) { tableView, index, cellViewModel in
            
            let indexPath = IndexPath(row: index, section: 0)
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier, for: indexPath) as! HomeViewCell
            cell.bind(withViewModel: cellViewModel)
            return cell
        }.disposed(by: disposeBag)
    }
    
    private func configureTableView() {
        tableView.register(cellType: HomeViewCell.self)
    }
    
}
