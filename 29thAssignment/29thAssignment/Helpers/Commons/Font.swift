//
//  Font.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/20.
//

import Foundation
import UIKit

/**
 다음 3가지의 커스텀 폰트를 사용한다.
 SFProDisplay-Regular
 SFProDisplay-Medium
 SFProDisplay-Semibold
 
 사용 예시)
 TextStyle.title.font
 TextStyle.placeholder.font
 
 팀 내에 디자인 시스템이 있다고 가정하고 확장성 있게 Font에 대한 작업 진행
 */


enum Font: String {
    case regular = "SFProDisplay-Regular"
    case medium = "SFProDisplay-Medium"
    case semibold = "SFProDisplay-Semibold"
    
    var name: String {
        return self.rawValue
    }
}

// 원래라면 폰트, 크기 외에 텍스트 스타일(TextStyle)까지 있어야겠지만 여기서는 제외시킴
struct FontDescription {
    let font: Font
    let size: CGFloat
}

// 열거형으로 구분해놓아 명칭으로 좀 더 쉽게,
// 지정된 폰트 스타일을 적용 가능
enum TextStyle {
    case welcomeMessage     // 26pt, Semibold (Welcome message)
    case title              // 22pt, Semibold (Title)
    case deccription        // 14pt, Regular
    case placeholder        // 15pt, Regular
    case buttonFill         // 14pt, Medium
    case buttonPlain        // 14pt, Medium
    case buttonSmall        // 13pt, Regular
}

extension TextStyle {
    private var fontDescription: FontDescription {
        switch self {
        case .welcomeMessage:   return FontDescription(font: .semibold, size: 26)
        case .title:            return FontDescription(font: .semibold, size: 22)
        case .deccription:      return FontDescription(font: .regular, size: 14)
        case .placeholder:      return FontDescription(font: .semibold, size: 15)
        case .buttonFill:       return FontDescription(font: .medium, size: 14)
        case .buttonPlain:      return FontDescription(font: .medium, size: 14)
        case .buttonSmall:      return FontDescription(font: .regular, size: 13)
        }
    }
}

extension TextStyle {
    // 자동으로 크기 조절 위한 처리
    // scaledFont(:_) 메서드 사용
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
            return UIFont()
        }
        return UIFontMetrics.default.scaledFont(for: font)
    }
}
