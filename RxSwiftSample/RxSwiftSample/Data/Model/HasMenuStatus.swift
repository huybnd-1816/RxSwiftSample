//
//  HasMenuStatus.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct HasMenuStatus: Decodable {
    let delivery: Int?
    let takeaway: Int?
    
    enum CodingKeys: String, CodingKey {
        case delivery
        case takeaway
    }
}
