//
//  RankCollectionViewCell.swift
//  29thSeminar3
//
//  Created by taehy.k on 2021/10/23.
//

import UIKit

class RankCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RankCollectionViewCell"
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appIconImageView: UIImageView!
    
    func setData(appName: String,
                 appImage: UIImage?) {
        appNameLabel.text = appName
        appIconImageView.image = appImage
    }
}
