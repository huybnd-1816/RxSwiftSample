//
//  Restaurants.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

struct Restaurants: Decodable {
    let restaurant: Restaurant?
    
    enum CodingKeys: String, CodingKey {
        case restaurant = "restaurant"
    }
}
