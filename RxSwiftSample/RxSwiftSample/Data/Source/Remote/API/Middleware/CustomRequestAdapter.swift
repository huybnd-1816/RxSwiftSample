//
//  CustomRequestAdapter.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/16/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Alamofire

final class CustomRequestAdapter: RequestAdapter {
    private var headers = Alamofire.SessionManager.defaultHTTPHeaders
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue(APIKey.apikey, forHTTPHeaderField: "user-key")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
}
