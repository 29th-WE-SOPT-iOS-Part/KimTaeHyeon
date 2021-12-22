//
//  UIStackView+Extension.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/04.
//

import UIKit

extension UIStackView {
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview(_:))
    }
}
