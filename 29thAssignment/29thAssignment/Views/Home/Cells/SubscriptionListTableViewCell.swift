//
//  SubscriptionListTableViewCell.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/25.
//

import UIKit

class SubscriptionListTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
