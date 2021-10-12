//
//  CommonTextField.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/08.
//

import UIKit

/**
 텍스트 필드 타입 구분 Enum
 */
enum TextFieldType {
    case name
    case contact
    case password
    
    var placeholder: String {
        switch self {
        case .name:
            return "이름을 입력해주세요"
        case .contact:
            return "이메일 또는 휴대전화"
        case .password:
            return "비밀번호 입력"
        }
    }
}

class CommonTextField: UITextField {
    // MARK: - Properties
    
    open var borderWidth: CGFloat = 0.5 {
        didSet {
            updateBorder()
        }
    }
    
    open var borderColor: UIColor = .darkGray {
        didSet {
            updateBorder()
        }
    }
    
    open var cornerRadius: CGFloat = 10 {
        didSet {
            updateBorder()
        }
    }

    open var placeholderText: String? {
        didSet {
            updatePlaceholder()
        }
    }
    
    open var placeholderPadding: CGFloat = 20 {
        didSet {
            updatePlaceholder()
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateBorder()
        updatePlaceholder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    convenience init(placeholder: String, textFieldType: TextFieldType) {
        self.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = textFieldType == .password ? true : false
    }
    
    // MARK: - Private
    
    private func updateBorder() {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
    }
    
    private func updatePlaceholder() {
        self.placeholder = placeholderText
        setLeftPadding(placeholderPadding)
        setRightPadding(placeholderPadding)
    }
}
