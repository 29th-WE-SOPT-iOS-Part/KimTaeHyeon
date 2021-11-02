//
//  HomeViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/19.
//

import UIKit

import SnapKit
import Then

// MARK: - HomeVC에서 사용될 셀 타입

private enum CellType {
    case channel
    case category
    case feed
}

class HomeViewController: UIViewController {
    
    // MARK: - UI properties
    
    var tableView = UITableView()
    
    // MARK: - Properties
    var thumbnailImages = [
        Const.Image.wesoptiOSPart,
        Const.Image.wesoptAndroidpart,
        Const.Image.wesoptPlanPart,
        Const.Image.wesoptDesignPart,
        Const.Image.wesoptServerPart,
    ]
    
    fileprivate let layout: [CellType] = [.channel, .category, .feed]

    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupNavigationItems()
        setupHierarchy()
        setupLayout()
        setupTableView()
        registerTableViewCell()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    private func registerTableViewCell() {
        tableView.register(FeedTableViewCell.self)
        tableView.register(ChannelListTableViewCell.self)
        tableView.register(CategoryListTableViewCell.self)
    }
    
    private func setupHierarchy() {
        view.addSubviews(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
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
}

//MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row > 2 ? 2 : indexPath.row
        
        switch layout[row] {
        case .channel:
            let channelCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ChannelListTableViewCell
            return channelCell
        case .category:
            let categoryCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CategoryListTableViewCell
            return categoryCell
        case .feed:
            let feedCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FeedTableViewCell
            feedCell.configureImage(thumbnailImage: thumbnailImages[indexPath.row % 5],
                                    profileImage: Const.Image.wesoptProfile36)
            return feedCell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row > 2 ? 2 : indexPath.row
        
        switch layout[row] {
        case .channel:
            return 105
        case .category:
            return 48
        case .feed:
            return UITableView.automaticDimension
        }
    }
}
