//
//  SVProgressHUD.swift
//  RxSwiftSample
//
//  Created by nguyen.duc.huyb on 8/28/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import RxSwift
import SVProgressHUD
import RxCocoa

extension Reactive where Base: SVProgressHUD {
    /// Bindable sink for `show()`, `hide()` methods.
    public static var isAnimating: Binder<Bool> {
        return Binder(UIApplication.shared) { progressHUD, isVisible in
            if isVisible {
                SVProgressHUD.show() // or other show methods
            } else {
                SVProgressHUD.dismiss() // or other hide methods
            }
        }
    }
}
