//
//  PaddingLabel.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/12.
//

/**
 다음 클래스는 padding이 있는 라벨을 만들기 위한 클래스입니다.
 
 다음과 같이 선언해서 사용할 수 있습니다.
 let titleLabel = PaddingLabel()
 
 padding을 조정하기 위해서는 padding 프로퍼티에 접근해서 값을 수정해줍니다.
 */

import UIKit

class PaddingLabel: UILabel {
    var padding: UIEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    
    override func drawText(in rect: CGRect) {
        let paddingRect = rect.inset(by: padding)
        super.drawText(in: paddingRect)
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
}
