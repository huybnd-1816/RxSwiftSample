//
//  Title.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct Title: Decodable {
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case text
    }
}
