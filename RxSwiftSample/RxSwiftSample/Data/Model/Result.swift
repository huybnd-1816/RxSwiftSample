//
//  Result.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct Result: Decodable {
    let hasMenuStatus: HasMenuStatus?
    let resId: Int?
    
    enum CodingKeys: String, CodingKey {
        case hasMenuStatus = "has_menu_status"
        case resId = "res_id"
    }
}
