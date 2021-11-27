//
//  SeparatorCollectionReusableView.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/07.
//

import UIKit

import SnapKit

class SeparatorCollectionReusableView: UICollectionReusableView, Reusable, NibLoadable {
    
    let separatorView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        addSubviews(separatorView)
        separatorView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(1)
        }
        separatorView.backgroundColor = .systemGray5
    }
}
