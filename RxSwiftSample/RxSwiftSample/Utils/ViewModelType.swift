//
//  ViewModelType.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
