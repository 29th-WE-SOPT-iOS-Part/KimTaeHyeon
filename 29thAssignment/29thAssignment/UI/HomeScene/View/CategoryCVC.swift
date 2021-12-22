//
//  CategoryCollectionViewCell.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/27.
//

import UIKit

class CategoryCVC: UICollectionViewCell {

    @IBOutlet weak var categoryBackgroundView: UIView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDefault()
    }
    
    override func prepareForReuse() {

    }
    
    private func setupDefault() {
        categoryBackgroundView.layer.cornerRadius = 16
        categoryBackgroundView.layer.borderColor = UIColor.systemGray4.cgColor
        categoryBackgroundView.layer.borderWidth = 1
    }
}
