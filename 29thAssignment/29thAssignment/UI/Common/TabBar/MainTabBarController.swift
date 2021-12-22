//
//  MainTabBarController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/19.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        setupTabBarItems()
    }
    
    // MARK: - Setup functions
    
    private func attribute() {
        tabBar.tintColor = .black
        tabBar.barTintColor = .white
    }
    
    private func setupTabBarItems() {
        let homeVC = HomeNavigationController(rootViewController: HomeVC())
        let shortsVC = ShortsVC()
        let plusVC = PlusVC()
        let subscriptionVC = SubscriptionVC()
        let libraryVC = LibraryVC()
        
        let viewControllers = [homeVC, shortsVC, plusVC, subscriptionVC, libraryVC]
        
        HomeTab.allCases.forEach {
            viewControllers[$0.rawValue].tabBarItem = $0.asTabBarItem()
        }
        
        setViewControllers(viewControllers, animated: true)
    }
}
