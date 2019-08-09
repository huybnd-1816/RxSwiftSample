//
//  User.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct User: Decodable {
    let name: String?
    let foodieLevel: String?
    let foodieLevelNum: Int?
    let foodieColor: String?
    let profileUrl: String?
    let profileImage: String?
    let profileDeeplink: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case foodieLevel = "foodie_level"
        case foodieLevelNum = "foodie_level_num"
        case foodieColor = "foodie_color"
        case profileUrl = "profile_url"
        case profileImage = "profile_image"
        case profileDeeplink = "profile_deeplink"
    }
}
