//
//  HomeViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/19.
//

import UIKit

import SnapKit
import Then

class HomeViewController: UIViewController {
    
    // MARK: - UI properties
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )
    private var tableView = UITableView()
    
    // MARK: - Properties
    private let channels: [Channel] = Channel.loadDummyList()
    private let categoryTitles = ["전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"]
    private let feeds: [Feed] = Feed.loadDummyList()

    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupNavigationItems()
        setupHierarchy()
        setupLayout()
        setupCollectionView()
        registerCollectionViewCell()
    }
    
    // 네비게이션 바 세팅

    private func setupNavigationBar() {
        navigationController?.hidesBarsOnSwipe = true
    }
    
    // 네비게이션 바 아이템 세팅
    // Left Item, Right Items
    private func setupNavigationItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIImageView(image: Const.Image.youtubePremiumLogo))
        self.navigationItem.rightBarButtonItems = getCustomBarButtonItems()
    }
    
    private func getCustomBarButtonItems() -> [UIBarButtonItem] {
        let shareItem = getCustomBarButtonItem(iconImage: Const.Image.windowSharingIcon)
        let notificationItem = getCustomBarButtonItem(iconImage: Const.Image.notificationIcon)
        let searchItem = getCustomBarButtonItem(iconImage: Const.Image.searchIcon)
        let profileItem = getCustomBarButtonItem(iconImage: Const.Image.wesoptProfile24)
        return [profileItem, searchItem, notificationItem, shareItem]
    }
    
    private func getCustomBarButtonItem(iconImage: UIImage?) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(iconImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
    
    
    // 레이아웃 세팅
    private func setupHierarchy() {
        view.addSubviews(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // 컬렉션뷰 세팅
    private func setupCollectionView() {
        collectionView.dataSource = self
    }
    
    private func registerCollectionViewCell() {
        collectionView.register(ChannelCollectionViewCell.self)
        collectionView.register(CategoryCollectionViewCell.self)
        collectionView.register(FeedCollectionViewCell.self)
        collectionView.register(SeparatorCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: SeparatorCollectionReusableView.reuseIdentifier)
    }
}

// MARK: - CollectionView DataSource

extension HomeViewController: UICollectionViewDataSource {
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
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ChannelCollectionViewCell
            let channel = channels[indexPath.row]
            cell.configure(subscriptionImage: channel.channelImage,
                           title: channel.channelTitle)
            return cell
        case .category:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CategoryCollectionViewCell
            cell.categoryTitleLabel.text = categoryTitles[indexPath.row]
            return cell
        case .feed:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as FeedCollectionViewCell
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
