//
//  RestaurantRepository.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/16/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import RxSwift

protocol RestaurantRepository {
    func searchRestaurants(searchText: String) -> Observable<[Restaurants]>
}

final class RestaurantRepositoryImpl: RestaurantRepository {
    private var api: APIService?
    
    required init(api: APIService) {
        self.api = api
    }
    
    func searchRestaurants(searchText: String) -> Observable<[Restaurants]> {
        return Observable.create { observer in
            let input = SearchRequest(searchText: searchText)
            self.api?.request(input: input) { (object: RestaurantResponse?, error) in
                if let object = object {
                    guard let restaurants = object.restaurants else { return }
                    observer.onNext(restaurants)
                    observer.onCompleted()
                } else if let error = error {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
