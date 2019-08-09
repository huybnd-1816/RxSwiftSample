//
//  Rating.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct Rating: Decodable {
    let title: Title?
    let bgColor: BgColor?
    
    enum CodingKeys: String, CodingKey {
        case title
        case bgColor = "bg_color"
    }
}
