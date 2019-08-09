//
//  AllReviews.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct AllReviews: Decodable {
    let reviews: [Reviews]?
    
    enum CodingKeys: String, CodingKey {
        case reviews
    }
}
