//
//  RestaurantRepository.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/16/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

protocol RestaurantRepository {
    func fetchRestaurants(searchText: String, completion: @escaping (BaseResult<RestaurantResponse>) -> Void)
}

final class RestaurantRepositoryImpl: RestaurantRepository {
    private var api: APIService?
    
    required init(api: APIService) {
        self.api = api
    }
    
    func fetchRestaurants(searchText: String, completion: @escaping (BaseResult<RestaurantResponse>) -> Void) {
        let input = SearchRequest(searchText: searchText)
        
        api?.request(input: input) { (object: RestaurantResponse?, error) in
            if let object = object {
                completion(.success(object))
            } else if let error = error {
                completion(.failure(error: error))
            } else {
                completion(.failure(error: nil))
            }
        }
    }
}
