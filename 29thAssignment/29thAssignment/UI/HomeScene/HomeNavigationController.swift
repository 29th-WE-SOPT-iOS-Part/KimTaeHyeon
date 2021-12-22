//
//  BaseNavigationController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/09.
//

import UIKit

class HomeNavigationController: BaseNavigationController {
    private enum ButtonType: Int, CaseIterable {
        case share, noti, search, profile
    }
    
    // MARK: - Properties
    
    let logoItem = UIBarButtonItem(customView: UIImageView(image: Image.youtubePremiumLogo))
    lazy var shareItem = createBarButtonItem(iconImage: Image.windowSharingIcon, tag: 0)
    lazy var notificationItem = createBarButtonItem(iconImage: Image.notificationIcon, tag: 1)
    lazy var searchItem = createBarButtonItem(iconImage: Image.searchIcon, tag: 2)
    lazy var profileItem = createBarButtonItem(iconImage: Image.wesoptProfile24, tag: 3)
    lazy var spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    
    // MARK: - Initializers
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setNavigationItems(navigationItem: rootViewController.navigationItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 바 버튼 아이템 클릭 액션
    @objc
    private func buttonDidTap(_ sender: UIButton) {
        switch ButtonType.allCases[sender.tag] {
        case .share:    return
        case .noti:     return
        case .search:   return
        case .profile:  transitionToSignInViewController()
        }
    }
    
    // 로그인 뷰로 화면 전환
    private func transitionToSignInViewController() {
        let signInVC = UINavigationController(rootViewController: GoogleSignInViewController())
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true, completion: nil)
    }
}

// MARK: - 네비게이션 바 세팅
extension HomeNavigationController {
    private func setNavigationItems(navigationItem: UINavigationItem?) {
        navigationItem?.leftBarButtonItem = logoItem
        navigationItem?.rightBarButtonItems = [profileItem, spacing, searchItem, spacing, notificationItem, spacing, shareItem]
    }

    private func createBarButtonItem(iconImage: UIImage?, tag: Int = 0) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(iconImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.tag = tag
        button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
}
