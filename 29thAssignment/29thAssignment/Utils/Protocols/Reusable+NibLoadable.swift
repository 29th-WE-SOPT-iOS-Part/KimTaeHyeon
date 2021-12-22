//
//  Reusable+NibLoadable.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/24.
//

import UIKit

// MARK: - reuseIdentifier
protocol Reusable {}

extension Reusable where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - nibName
protocol NibLoadable { }

extension NibLoadable where Self: UIView {

    static var nibName: String {
        return String(describing: self)
    }
}
