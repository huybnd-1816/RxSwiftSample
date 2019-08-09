//
//  Photo.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct Photo: Decodable {
    let id: String?
    let url: String?
    let thumbUrl: String?
    let user: User?
    let resId: Int?
    let caption: String?
    let timestamp: Int?
    let friendlyTime: String?
    let width: Int?
    let height: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case thumbUrl = "thumb_url"
        case user
        case resId = "res_id"
        case caption
        case timestamp
        case friendlyTime = "friendly_time"
        case width = "width"
        case height = "height"
    }
}
