//
//  ChannelCollectionViewCell.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/25.
//

import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var subscriptionImageView: UIImageView!
    @IBOutlet weak var subscriptionTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(subscriptionImage: UIImage?,
                          title: String) {
        if let subscriptionImage = subscriptionImage {
            subscriptionImageView.image = subscriptionImage
        }
        subscriptionTitleLabel.text = title
    }
}
