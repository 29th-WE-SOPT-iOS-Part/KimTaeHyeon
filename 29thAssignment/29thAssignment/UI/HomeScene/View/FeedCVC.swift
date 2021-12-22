//
//  FeedCollectionViewCell.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/04.
//

import UIKit

class FeedCVC: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedSubInformationLabel: UILabel!

    var imageViewClosure: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        setTapGesture()
    }

    // 재사용으로 인한 이슈 방지
    override func prepareForReuse() {
        thumbnailImageView.image = nil
        profileImageView.image = nil
    }
    
    // 데이터 설정 함수
    public func configure(feed: Feed?) {
        if let feed = feed {
            thumbnailImageView.image = feed.thumbnailImage
            profileImageView.image = feed.profileImage
            feedTitleLabel.text = feed.feedTitle
            feedSubInformationLabel.text = feed.feedSubtitle
        }
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(transferData))
        thumbnailImageView.addGestureRecognizer(tapGesture)
        thumbnailImageView.isUserInteractionEnabled = true
    }
    
    @objc
    func transferData() {
        imageViewClosure?()
    }
}
