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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // 재사용으로 인한 이슈 방지
    override func prepareForReuse() {
        thumbnailImageView.image = nil
        profileImageView.image = nil
    }
    
    // 데이터 설정 함수
    public func configure(thumbnailImage: UIImage?,
                          profileImage: UIImage?,
                          feedTitle: String,
                          feedSubInformation: String) {
        
        if let thumbnailImage = thumbnailImage,
           let profileImage = profileImage {
            thumbnailImageView.image = thumbnailImage
            profileImageView.image = profileImage
            feedTitleLabel.text = feedTitle
            feedSubInformationLabel.text = feedSubInformation
        }
    }
}
