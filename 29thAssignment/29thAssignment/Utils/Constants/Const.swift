//
//  Const.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/19.
//

import UIKit

struct Const {
    struct Color {
        static let googleBlue = UIColor(red: 66/255.0, green: 133/255.0, blue: 244/255.0, alpha: 1.0)
    }
    
    struct Text {
        static let authDescription = "Youtube도 이동하며 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다."
    }
    
    struct Figure {
        static let sidePadding = 22
        static let textFieldSpacing = 17.0
    }
    
    struct Image {
        static let checkmarkFill = UIImage(systemName: "checkmark.square.fill")
        static let checkmarkEmpty = UIImage(systemName: "square")
        
        static let logo = UIImage(named: "logo")
        static let homeIcon = UIImage(named: "homeIcon")
        static let homeIconFill = UIImage(named: "homeIconFill")
        static let LibraryIcon = UIImage(named: "LibraryIcon")
        static let LibraryIconFill = UIImage(named: "LibraryIconFill")
        static let plusCircleIcon = UIImage(named: "plusCircleIcon")
        static let shortsIcon = UIImage(named: "shortsIcon")
        static let shortsIconFill = UIImage(named: "shortsIconFill")
        static let subscriptionsIcon = UIImage(named: "subscriptionsIcon")
        static let subscriptionsIconFill = UIImage(named: "subscriptionsIconFill")
    }
}
