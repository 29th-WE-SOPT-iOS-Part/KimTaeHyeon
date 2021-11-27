//
//  HomeTab.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import UIKit

/**
 "홈", "Shorts" , "추가", "구독", "보관함"
 */
enum HomeTab: Int, CaseIterable {
    case home
    case shorts
    case plus
    case subscription
    case library
}

extension HomeTab {
    var description: String {
        switch self {
        case .home: return "홈"
        case .shorts: return "Shorts"
        case .plus: return "추가"
        case .subscription: return "구독"
        case .library: return "보관함"
        }
    }
}

extension HomeTab {
    var activeIcon: UIImage? {
        switch self {
        case .home:         return Image.homeIconFill
        case .shorts:       return Image.shortsIconFill
        case .plus:         return Image.plusCircleIcon
        case .subscription: return Image.subscriptionsIconFill
        case .library:      return Image.LibraryIconFill
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home:         return Image.homeIcon
        case .shorts:       return Image.shortsIcon
        case .plus:         return Image.plusCircleIcon
        case .subscription: return Image.subscriptionsIcon
        case .library:      return Image.LibraryIcon
        }
    }
}

extension HomeTab {
    public func asTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: description,
            image: icon,
            selectedImage: activeIcon
        )
    }
}
