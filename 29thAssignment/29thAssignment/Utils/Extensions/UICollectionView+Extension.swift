//
//  UICollectionView+Extension.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/25.
//

import UIKit

extension UICollectionView {
    // 셀을 등록하는 메서드
    func register<T: UICollectionViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    // 셀을 꺼내는 메서드
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
