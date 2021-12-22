//
//  TextFieldGenerator.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/12.
//

/**
 다음은 텍스트 필드를 만들때 공통적으로 들어가면 좋을 것 같은 요소를 모아놓은 프로토콜입니다.
 */

import UIKit

/**
 프로토콜 네이밍에 대해 고민함.
 - Generator라는 명사를 이용해서 텍스트 필드를 만들어낸다는 의미를 담음.
 
 반드시 들어가야 할 법한 프로퍼티를 정의함
 - borderSize : 테두리 두께
 - activeBorderColor : (활성화 되었을 때) 테두리 색상
 - inactiveBorderColor : (비활성화 되었을 때) 테두리 색상
 - cornerRadius : 테두리 둥근 정도
 
 - inset : 내부 padding 값
 - placeholderText : placeholder 텍스트
 - placeholderColor : placeholder 색상
 */
protocol TextFieldGenerator {
    var borderSize: CGFloat { get set }
    var activeBorderColor: UIColor { get set }
    var inactiveBorderColor: UIColor { get set }
    var cornerRadius: CGFloat { get set }
    
    var placeholderText: String? { get set }
    var placeholderColor: UIColor? { get set }
    var cursorColor: UIColor { get set }
    
    var inset: CGFloat { get set }
}
