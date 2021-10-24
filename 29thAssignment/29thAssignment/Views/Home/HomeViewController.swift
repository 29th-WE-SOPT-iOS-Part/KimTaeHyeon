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
    
    var tableView = UITableView()
    
    // MARK: - Properties
    var thumbnailImages = [
        Const.Image.wesoptiOSPart,
        Const.Image.wesoptAndroidpart,
        Const.Image.wesoptPlanPart,
        Const.Image.wesoptDesignPart,
        Const.Image.wesoptServerPart,
    ]

    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupTableView()
        registerTableViewCell()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func registerTableViewCell() {
        tableView.register(FeedTableViewCell.self)
    }
    
    private func setupHierarchy() {
        view.addSubviews(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

//MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FeedTableViewCell
        
        cell.configureImage(thumbnailImage: thumbnailImages[indexPath.row % 5],
                            profileImage: Const.Image.wesoptProfile)
        
        return cell
    }
}
