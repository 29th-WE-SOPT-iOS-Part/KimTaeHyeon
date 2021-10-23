//
//  AppContentData.swift
//  29thSeminar3
//
//  Created by taehy.k on 2021/10/23.
//

import UIKit

struct AppContentData {
    let appName: String
    let description: String
    let appIconName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}
