//
//  MainRxViewModel.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import RxSwift
import RxCocoa

final class MainRxViewModel: ViewModelType {
    
    struct Input {
        let ready: Driver<Void>
        let selectedIndex: Driver<IndexPath>
        let searchText: Driver<String>
    }
    
    struct Output {
        let loading: Driver<Bool>
        let repos: Driver<[Restaurants]>
        let selectedRepoId: Driver<String>
    }
    
    struct Dependencies {
        let networking: RestaurantRepositoryImpl
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: Input) -> Output {
        let loading = ActivityIndicator()
        
        let initialRepos = input.ready
            .flatMap { _ in
                self.dependencies.networking
                    .searchRestaurants(searchText: "italy")
                    .trackActivity(loading)
                    .asDriver(onErrorJustReturn: [])
            }
        
        let searchRepos = input.searchText
            .filter { $0.count > 2 }
            .map {
                $0.replacingOccurrences(of: " ", with: "%20")
            }
            .throttle(0.3)
            .distinctUntilChanged()
            //if search: doesn't finish, the observable is cancelled
            .flatMapLatest { query in
                self.dependencies.networking
                    .searchRestaurants(searchText: query)
                    .trackActivity(loading)
                    .asDriver(onErrorJustReturn: [])
            }
        
        let repos = Driver.merge(initialRepos, searchRepos)
        
        let selectedRepoId = input.selectedIndex
            .withLatestFrom(repos) { (indexPath, repos) in
                return repos[indexPath.row]
            }
            .map { $0.restaurant!.id! }
        
        return Output(loading: loading.asDriver(), repos: repos, selectedRepoId: selectedRepoId)
    }
}
