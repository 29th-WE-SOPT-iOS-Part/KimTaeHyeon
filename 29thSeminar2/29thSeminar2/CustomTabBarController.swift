//
//  CustomTabBarController.swift
//  29thSeminar2
//
//  Created by taehy.k on 2021/10/09.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    private func setupTabBar() {
        guard let orangeVC = self.storyboard?.instantiateViewController(withIdentifier: "OrangeViewController"),
              let purpleVC = self.storyboard?.instantiateViewController(withIdentifier: "PurpleViewController")
        else { return }
        
        /**
         - title: 탭바 아이콘 타이틀
         - image: 탭바 아이콘 기본 이미지
         - selectedImage: 탭바 아이콘 선택 이미지
         */
        orangeVC.tabBarItem.title = "Home"
        orangeVC.tabBarItem.image = UIImage(systemName: "house")
        orangeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        purpleVC.tabBarItem.title = "Profile"
        purpleVC.tabBarItem.image = UIImage(systemName: "person")
        purpleVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        // 탭바에 뷰컨트롤러 배열 전달
        setViewControllers([orangeVC, purpleVC], animated: true)
    }
}
