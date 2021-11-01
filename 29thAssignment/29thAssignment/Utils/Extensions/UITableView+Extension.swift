//
//  UITableView+Extension.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/25.
//

import UIKit

extension UITableView {
    
    // 셀을 등록하는 메서드
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    // 셀을 꺼내는 메서드
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
