//
//  SearchRestaurantRequest.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/16/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Alamofire

final class SearchRequest: BaseRequest {
    
    required init(searchText: String) {
        super.init(url: Urls.basePath + "search?q=" + searchText, requestType: .get, parameters: nil)
    }
}
