//
//  BgColor.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct BgColor: Decodable {
    let type: String?
    let tint: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case tint
    }
}
