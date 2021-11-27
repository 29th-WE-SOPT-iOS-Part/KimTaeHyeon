//
//  HomeViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/19.
//

import UIKit

import SnapKit
import Then

final class HomeVC: BaseViewController {
    
    // MARK: - UI properties
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )
    
    // MARK: - Properties
    private let channels: [Channel] = Channel.dummy
    private let categoryTitles = Category.allCases.map({ $0.description })
    private let feeds: [Feed] = Feed.dummy

    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        registerCollectionViewCell()
    }
    
    // 네비게이션 바 세팅
    private func setupNavigationBar() {
        navigationController?.hidesBarsOnSwipe = true
    }
    
    // 계층 세팅
    override func hierarchy() {
        view.addSubviews(collectionView)
    }
    
    // 레이아웃 세팅
    override func layout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // 컬렉션뷰 세팅
    private func setupCollectionView() {
        collectionView.dataSource = self
    }
    
    private func registerCollectionViewCell() {
        collectionView.register(ChannelCVC.self)
        collectionView.register(CategoryCVC.self)
        collectionView.register(FeedCVC.self)
        collectionView.register(SeparatorCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: SeparatorCollectionReusableView.reuseIdentifier)
    }
}

// MARK: - CollectionView DataSource

extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        SectionLayout.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch SectionLayout.allCases[section] {
        case .channel:
            return channels.count
        case .category:
            return categoryTitles.count
        case .feed:
            return feeds.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch SectionLayout.allCases[indexPath.section] {
        case .channel:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ChannelCVC
            let channel = channels[indexPath.row]
            cell.configure(subscriptionImage: channel.channelImage,
                           title: channel.channelTitle)
            return cell
        case .category:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CategoryCVC
            cell.categoryTitleLabel.text = categoryTitles[indexPath.row]
            return cell
        case .feed:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as FeedCVC
            let feed = feeds[indexPath.row]
            cell.configure(thumbnailImage: feed.thumbnailImage,
                           profileImage: feed.profileImage,
                           feedTitle: feed.feedTitle,
                           feedSubInformation: feed.feedSubtitle)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                           withReuseIdentifier: SeparatorCollectionReusableView.reuseIdentifier,
                                                                           for: indexPath) as? SeparatorCollectionReusableView
        else {
            return UICollectionReusableView()
        }
        return footer
    }
}
