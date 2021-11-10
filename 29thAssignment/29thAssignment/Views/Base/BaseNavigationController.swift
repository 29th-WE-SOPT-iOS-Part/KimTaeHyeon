//
//  BaseNavigationController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/09.
//

import UIKit

class BaseNavigationController: UINavigationController {
    private enum ButtonType: Int, CaseIterable {
        case share, noti, search, profile
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setNavigationItems(navigationItem: rootViewController.navigationItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarAppearance()
    }
    
    // Set funcions
    // iOS15 부터 appearance를 다음과 같이 설정해줌
    private func setNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.tintColor = .black
    }
    
    // 네비게이션 바 아이템 세팅
    private func setNavigationItems(navigationItem: UINavigationItem?) {
        let logoItem = UIBarButtonItem(customView: UIImageView(image: Const.Image.youtubePremiumLogo))
        navigationItem?.leftBarButtonItem = logoItem
        navigationItem?.rightBarButtonItems = getBarButtonItems()
    }
    
    private func getBarButtonItems() -> [UIBarButtonItem] {
        let shareItem = createBarButtonItem(iconImage: Const.Image.windowSharingIcon, tag: 0)
        let notificationItem = createBarButtonItem(iconImage: Const.Image.notificationIcon, tag: 1)
        let searchItem = createBarButtonItem(iconImage: Const.Image.searchIcon, tag: 2)
        let profileItem = createBarButtonItem(iconImage: Const.Image.wesoptProfile24, tag: 3)
        
        let spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        return [profileItem, spacing, searchItem, spacing, notificationItem, spacing, shareItem]
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
    
    // 바 버튼 아이템 클릭 시
    @objc
    private func buttonDidTap(_ sender: UIButton) {
        switch ButtonType.allCases[sender.tag] {
        case .share:        print("share button tap")
        case .noti:         print("noti button tap")
        case .search:       print("search button tap")
        case .profile:      transitionToSignInViewController()
        }
    }
    
    private func transitionToSignInViewController() {
        let signInViewController = UINavigationController(rootViewController: GoogleSignInViewController())
        signInViewController.modalPresentationStyle = .fullScreen
        present(signInViewController, animated: true, completion: nil)
    }
}
