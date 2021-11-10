//
//  UIScreen+Extension.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/18.
//

import UIKit

extension UIScreen {
    public var hasNotch: Bool {
        let deviceRatio = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        if deviceRatio > 0.5 {
            return false
        } else {
            return true
        }
    }
}
