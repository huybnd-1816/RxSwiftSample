//
//  Location.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/9/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//


struct Location: Decodable {
    let address: String?
    let locality: String?
    let city: String?
    let cityId: Int?
    let latitude: String?
    let longitude: String?
    let zipcode: String?
    let countryId: Int?
    let localityVerbose: String?
    
    enum CodingKeys: String, CodingKey {
        case address
        case locality
        case city
        case cityId = "city_id"
        case latitude
        case longitude
        case zipcode
        case countryId = "country_id"
        case localityVerbose = "locality_verbose"
    }
}
