//
//  UIView+Extensions.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

extension UIView {
    /// 하위 뷰(Multiple) 추가 메서드
    /// - Parameter views: 추가 할 하위 뷰(Multiple)
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview(_:))
    }
}
