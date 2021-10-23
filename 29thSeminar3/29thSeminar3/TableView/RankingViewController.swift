//
//  RankingViewController.swift
//  29thSeminar3
//
//  Created by taehy.k on 2021/10/23.
//

import UIKit

class RankingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var appContentList: [AppContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerXib()
        initAppContentList()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func registerXib(){
        let xibName = UINib(nibName: RankingTableViewCell.identifier, bundle: nil)
        tableView.register(xibName, forCellReuseIdentifier: RankingTableViewCell.identifier)
    }
    
    func initAppContentList(){
        appContentList.append(contentsOf: [
            AppContentData(appName: "질병관리청",description: "전자예방접종증명서",appIconName: "coovIcon"),
            AppContentData(appName: "카카오톡", description: "소셜 네트워킹", appIconName: "kakaoIcon"),
            AppContentData(appName: "YouTube", description: "동영상과 음악", appIconName: "youtubeIcon"),
            AppContentData(appName: "네이버", description: "검색과 콘텐츠, 쇼핑, 내도구", appIconName: "naverIcon"),
            AppContentData(appName: "Instagram", description: "사진 및 비디오", appIconName: "instagramIcon"),
            AppContentData(appName: "쿠팡", description: "스마트한 쇼핑", appIconName: "coupangIcon"),
            AppContentData(appName: "배달의 민족", description: "대한민국 1등 배달앱", appIconName: "baeminIcon"),
            AppContentData(appName: "당근마켓", description: "중고거래", appIconName: "karrotIcon"),
            AppContentData(appName: "Netflix", description: "지금 바로 시청하세요", appIconName: "netflixIcon"),
            AppContentData(appName: "무신사", description: "브랜드 패션 쇼핑", appIconName: "musinsaIcon")
        ])
    }
    
    
}

extension RankingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension RankingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appContentList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.identifier) as? RankingTableViewCell else {return UITableViewCell()}
        
        cell.setData(rank: indexPath.row + 1, appData: appContentList[indexPath.row])
        return cell
    }
}

typealias CollectionViewMethods = UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension RankingViewController: CollectionViewMethods {
    
    // MARK: - DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankCollectionViewCell.identifier, for: indexPath) as? RankCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(appName: appContentList[indexPath.row].appName,
                     appImage: appContentList[indexPath.row].makeImage())
        return cell
    }
    
    // MARK: - Item
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
