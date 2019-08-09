//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import RxCocoa
import RxSwift

final class MainViewController: UIViewController {
    @IBOutlet private weak var restaurantTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var viewModel: MainViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setupSearchBar()
    }
    
    private func config() {
        viewModel = MainViewModel()
        restaurantTableView.dataSource = viewModel
        restaurantTableView.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
        
        restaurantTableView.rowHeight = UITableView.automaticDimension
        restaurantTableView.estimatedRowHeight = 44
        
        viewModel.didChanged = { [weak self] in
            guard let self = self else { return }
            self.restaurantTableView.reloadData()
        }
    }
    
    private func setupSearchBar() {
        searchBar
            .rx.text // Observable property thanks to RxCocoa
            .orEmpty // Make it non-optional
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance) // Wait 0.5 for changes.
            .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
            .filter { !$0.isEmpty } // Filter for non-empty query.
            .subscribe(onNext: { [unowned self] query in // Here we will be notified of every new value
                // We now do our "API Request" to find cities.
                self.viewModel.fetchData(query)
                self.restaurantTableView.reloadData() // And reload table view data.
            })
            .disposed(by: disposeBag)
    }
}
