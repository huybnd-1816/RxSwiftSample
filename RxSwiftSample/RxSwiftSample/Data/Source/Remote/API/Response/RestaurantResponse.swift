//
//  RestaurantResponse.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct RestaurantResponse: Decodable {
    let resultsFound: Int?
    let resultsStart: Int?
    let resultsShown: Int?
    let restaurants: [Restaurants]?
    
    enum CodingKeys: String, CodingKey {
        case resultsFound = "results_found"
        case resultsStart = "results_start"
        case resultsShown = "results_shown"
        case restaurants = "restaurants"
    }
}
