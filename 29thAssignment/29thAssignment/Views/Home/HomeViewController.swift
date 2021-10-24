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

    // MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .blue
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
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

//MARK: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
}
