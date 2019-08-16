//
//  MainViewModel.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/16/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


final class MainViewModel: NSObject {
    private var restaurants: [Restaurants]! = []
    private let repoRepository = RestaurantRepositoryImpl(api: APIService.shared)
    
    var didChanged: (() -> Void)?
    var isFetching: Bool = false
    
    override init() {
        super.init()
    }
    
    func fetchData(_ searchText: String) {
        guard !isFetching else { return }
        
        isFetching = true
        repoRepository.fetchRestaurants(searchText: searchText) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let data = response
                     else { return }
                self.restaurants = data.restaurants
                self.didChanged?()
            case .failure(let error):
                print(error?.errorMessage)
            }
            self.isFetching = false
        }
    }
}

extension MainViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as? RestaurantCell
            else { return UITableViewCell() }
        cell.configCell(restaurants[indexPath.row])
        return cell
    }
}
