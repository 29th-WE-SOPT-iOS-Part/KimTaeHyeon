//
//  ChannelListTableViewCell.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/25.
//

import UIKit

class ChannelListTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var subscriptionImages = [
        Const.Image.ggamju1,
        Const.Image.ggamju2,
        Const.Image.ggamju3,
        Const.Image.ggamju4,
        Const.Image.ggamju5,
        Const.Image.ggamju6,
        Const.Image.ggamju7,
        Const.Image.ggamju8,
    ]
    
    var subscriptionTitles = [
        "iOSPart", "AndroidPart", "ServerPart",
        "WebPart", "DesignPart", "PlanPart",
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
        collectionView.register(ChannelCollectionViewCell.self)
    }
}

extension ChannelListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ChannelCollectionViewCell
        cell.configure(subscriptionImage: subscriptionImages[indexPath.row % 8],
                       title: subscriptionTitles[indexPath.row % 6])
        return cell
    }
}

extension ChannelListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
}
