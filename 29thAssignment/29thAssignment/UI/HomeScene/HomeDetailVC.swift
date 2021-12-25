//
//  HomeDetailVC.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/12/23.
//

import UIKit

final class HomeDetailVC: BaseViewController {

    private lazy var dismissBtn = UIButton().then {
        $0.setImage(Image.dismissBtnIcon, for: .normal)
        $0.addTarget(self, action: #selector(dismissBtnDidTapped), for: .touchUpInside)
    }
    private let imageView = UIImageView().then {
        $0.backgroundColor = .red
    }
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = UIFont(name: Font.regular.name, size: 15)
    }
    private let subLabel = UILabel().then {
        $0.numberOfLines = 1
        $0.font = UIFont(name: Font.regular.name, size: 13)
        $0.textColor = .gray
    }
    private lazy var expandBtn = UIButton().then {
        $0.setImage(Image.expandBtnIcon, for: .normal)
    }
    
    var feed: Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func attribute() {
        view.backgroundColor = .systemBackground
        
        if let feed = feed {
            imageView.image = feed.thumbnailImage
            titleLabel.text = feed.feedTitle
            subLabel.text = feed.feedSubtitle
        }
    }
    
    override func hierarchy() {
        view.addSubviews(imageView, dismissBtn, expandBtn, titleLabel, subLabel)
    }
    
    override func layout() {
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(212)
        }
        
        dismissBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
        }
        
        expandBtn.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.width.height.equalTo(26)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(93)
        }
        
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(imageView).inset(12)
        }
    }
    
    @objc
    func dismissBtnDidTapped() {
        dismiss(animated: true)
    }
}
