//
//  CategoryListTableViewCell.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/27.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell, NibLoadable, Reusable {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categoryTitles = [
        "전체", "오늘", "이어서 시청하기",
        "시청하지 않음", "실시간", "게시물",
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        registerCollectionViewCell()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func registerCollectionViewCell() {
        collectionView.register(CategoryCollectionViewCell.self)
    }
    
    
}

extension CategoryListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CategoryCollectionViewCell
        cell.categoryTitleLabel.text = categoryTitles[indexPath.row]
        return cell
    }
}

extension CategoryListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryTitles[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 20, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
    }
}
