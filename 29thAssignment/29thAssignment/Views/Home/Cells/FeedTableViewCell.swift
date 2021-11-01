//
//  FeedTableViewCell.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/25.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedSubInformationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // 재사용으로 인한 이슈 방지
    override func prepareForReuse() {
        thumbnailImageView.image = nil
        profileImageView.image = nil
    }
    
    // 데이터 설정 함수
    public func configure(thumbnailImageUrl: String,
                          profileImageUrl: String,
                          feedTitle: String,
                          feedSubInformation: String) {
        
        if let thumbnailImage = UIImage(named: thumbnailImageUrl),
           let profileImage = UIImage(named: profileImageUrl) {
            thumbnailImageView.image = thumbnailImage
            profileImageView.image = profileImage
        }
        feedTitleLabel.text = feedTitle
        feedSubInformationLabel.text = feedSubInformation
    }
    
    // 이미지 설정 함수 (이미지만 테스트하려고 만든 함수)
    public func configureImage(thumbnailImage: UIImage?,
                               profileImage: UIImage?) {
        if let thumbnailImage = thumbnailImage,
           let profileImage = profileImage {
            thumbnailImageView.image = thumbnailImage
            profileImageView.image = profileImage
        }
    }
}

extension FeedTableViewCell: Reusable, NibLoadable {}
