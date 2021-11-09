//
//  BaseTabBarController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/19.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    // MARK: - Properties
    // 세 가지 프로퍼티에 대한 처리를 해시나 다른 자료구조로 변경하기
    
    let imageTitle = [
        "홈", "Shorts" , "추가", "구독", "보관함"
    ]
    
    let selectedImages = [
        Const.Image.homeIconFill,
        Const.Image.shortsIconFill,
        Const.Image.plusCircleIcon,
        Const.Image.subscriptionsIconFill,
        Const.Image.LibraryIconFill,
    ]
    
    let images = [
        Const.Image.homeIcon,
        Const.Image.shortsIcon,
        Const.Image.plusCircleIcon,
        Const.Image.subscriptionsIcon,
        Const.Image.LibraryIcon
    ]
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAttributes()
        setupTabBarItems()
    }
    
    // MARK: - Setup functions
    
    private func setupTabBarAttributes() {
        tabBar.tintColor = .black
        tabBar.barTintColor = .white
    }
    
    private func setupTabBarItems() {
        let homeNavVC = BaseNavigationController(rootViewController: HomeViewController())
        let shortsNavVC = UINavigationController(rootViewController: ShortsViewController())
        let plusNavVC = UINavigationController(rootViewController: PlusViewController())
        let subscriptionNavVC = BaseNavigationController(rootViewController: SubscriptionViewController())
        let libraryNavVC = BaseNavigationController(rootViewController: LibraryViewController())
        
        let navViewControllers = [homeNavVC, shortsNavVC, plusNavVC, subscriptionNavVC, libraryNavVC]

        for i in 0..<navViewControllers.count {
            navViewControllers[i].tabBarItem = UITabBarItem(title: imageTitle[i],
                                                            image: images[i],
                                                            selectedImage: selectedImages[i])
        }
        
        viewControllers = navViewControllers
    }
}