//
//  PartDataModel.swift
//  29thSeminar3
//
//  Created by taehy.k on 2021/10/23.
//

import UIKit

struct PartData {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
