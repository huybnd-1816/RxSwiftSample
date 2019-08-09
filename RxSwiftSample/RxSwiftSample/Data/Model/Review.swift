//
//  Review.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct Review: Decodable {
    let rating: Float?
    let reviewText: String?
    let id: Int?
    let ratingColor: String?
    let reviewTimeFriendly: String?
    let ratingText: String?
    let timestamp: Int?
    let likes: Int?
    let user: User?
    let commentsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case rating = "rating"
        case reviewText = "review_text"
        case id = "id"
        case ratingColor = "rating_color"
        case reviewTimeFriendly = "review_time_friendly"
        case ratingText = "rating_text"
        case timestamp = "timestamp"
        case likes = "likes"
        case user = "user"
        case commentsCount = "comments_count"
    }
}
