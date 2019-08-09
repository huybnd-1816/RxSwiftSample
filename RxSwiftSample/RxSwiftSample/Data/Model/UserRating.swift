//
//  UserRating.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

struct UserRating: Decodable {
    let aggregateRating: JSONValue?
    let ratingText: String?
    let ratingColor: String?
    let rating: Rating?
    let votes: JSONValue?
    
    enum CodingKeys: String, CodingKey {
        case aggregateRating = "aggregate_rating"
        case ratingText = "rating_text"
        case ratingColor = "rating_color"
        case rating = "rating_obj"
        case votes = "votes"
    }
}
