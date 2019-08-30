//
//  MainRxViewController.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import RxSwift
import RxCocoa
import SVProgressHUD

final class MainRxViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private let repoRepository = RestaurantRepositoryImpl(api: APIService.shared)
    private var viewModel: MainRxViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        bindViewModel()
    }
    
    private func config() {
        viewModel = MainRxViewModel(dependencies: MainRxViewModel.Dependencies(networking: repoRepository))
        tableView.register(UINib(nibName: "RestaurantCell", bundle: nil), forCellReuseIdentifier: "RestaurantCell")
    }
    
    private func bindViewModel() {
        let input = MainRxViewModel.Input(ready: rx.viewWillAppear.asDriver(),
                                           selectedIndex: tableView.rx.itemSelected.asDriver(),
                                           searchText: searchBar.rx.text.orEmpty.asDriver())
        
        let output = viewModel.transform(input: input)
        
        output.repos
            .drive(tableView.rx.items(cellIdentifier: "RestaurantCell", cellType: RestaurantCell.self)) { (row, element, cell) in
                cell.configCell(element)
            }
            .disposed(by: disposeBag)
        
        output.loading
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
        output.loading
            .drive(SVProgressHUD.rx.isAnimating)
            .disposed(by: disposeBag)
        
        output.selectedRepoId
            .drive(onNext: { [weak self] repoId in
            guard let self = self else { return }
            let alertController = UIAlertController(title: repoId, message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        })
        .disposed(by: disposeBag)
    }
}
