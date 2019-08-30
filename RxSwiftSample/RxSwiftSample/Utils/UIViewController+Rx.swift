//
//  UIViewController+Rx.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/27/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear(_:))).map { _ in }
        return ControlEvent(events: source)
    }
}
