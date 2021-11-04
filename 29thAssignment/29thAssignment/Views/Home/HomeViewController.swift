//
//  HomeViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/19.
//

import UIKit

import SnapKit
import Then
import SwiftUI

// MARK: - HomeVC에서 사용될 셀 타입

private enum CellType {
    case channel
    case category
    case feed
}

class HomeViewController: UIViewController {
    
    // MARK: - UI properties
    lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
    )
    var tableView = UITableView()
    
    // MARK: - Properties
    var thumbnailImages = [
        Const.Image.wesoptiOSPart,
        Const.Image.wesoptAndroidpart,
        Const.Image.wesoptPlanPart,
        Const.Image.wesoptDesignPart,
        Const.Image.wesoptServerPart,
    ]
    
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
    
    var categoryTitles = [
        "전체", "오늘", "이어서 시청하기",
        "시청하지 않음", "실시간", "게시물",
    ]
    
    fileprivate let layout: [CellType] = [.channel, .category, .feed]

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
        let titleImageView = UIImageView().then {
            $0.image = Const.Image.youtubePremiumLogo
            $0.contentMode = .scaleAspectFill
        }
        
        let shareImageView = UIImageView().then {
            $0.image = Const.Image.windowSharingIcon
            $0.contentMode = .scaleAspectFill
        }
        
        let notificationeImageView = UIImageView().then {
            $0.image = Const.Image.notificationIcon
            $0.contentMode = .scaleAspectFill
        }
        
        let searchImageView = UIImageView().then {
            $0.image = Const.Image.searchIcon
            $0.contentMode = .scaleAspectFill
        }
        
        let profileImageView = UIImageView().then {
            $0.image = Const.Image.wesoptProfile24
            $0.contentMode = .scaleAspectFill
        }
        
        let shareItem = UIBarButtonItem(customView: shareImageView)
        let notificationItem = UIBarButtonItem(customView: notificationeImageView)
        let searchItem = UIBarButtonItem(customView: searchImageView)
        let profileItem = UIBarButtonItem(customView: profileImageView)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleImageView)
        self.navigationItem.rightBarButtonItems = [profileItem, searchItem, notificationItem, shareItem]
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
    }
}

extension HomeViewController {
    // MARK: - Composional Layout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (sectionIndex, env)
            -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
            case 0: return self.createChannelSection()
            case 1: return self.createCategorySection()
            case 2: return self.createFeedSection(env)
            default: return nil
            }
        }
    }
    
    private func createChannelSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .estimated(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(72), heightDimension: .absolute(104)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .estimated(1), heightDimension: .absolute(32)))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .estimated(1),
                heightDimension: .absolute(48)
            ),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 9
        section.contentInsets = .init(top: 0, leading: 13, bottom: 0, trailing: 13)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createFeedSection(_ env: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let listConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        return NSCollectionLayoutSection.list(using: listConfig,layoutEnvironment: env)
    }
}

// MARK: - CollectionView DataSource

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch layout[section] {
        case .channel:
            return 10
        default:
            return categoryTitles.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch layout[indexPath.section] {
        case .channel:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ChannelCollectionViewCell
            cell.configure(subscriptionImage: subscriptionImages[indexPath.row % 8],
                           title: subscriptionTitles[indexPath.row % 6])
            return cell
        case .category:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CategoryCollectionViewCell
            cell.categoryTitleLabel.text = categoryTitles[indexPath.row]
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as FeedCollectionViewCell
            cell.configureImage(thumbnailImage: thumbnailImages[indexPath.row % 5],
                                profileImage: Const.Image.wesoptProfile24)
            return cell
        }

    }
}
