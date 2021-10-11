//
//  CommonAuthView.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/09.
//

import UIKit

import Then
import SnapKit

enum AuthType {
    case SignIn
    case SignUp
    
    var title: String {
        switch self {
        case .SignIn:
            return "로그인"
        case .SignUp:
            return "회원가입"
        }
    }
}

struct Const {
    struct Color {
        static let googleBlue = UIColor(red: 66/255.0, green: 133/255.0, blue: 244/255.0, alpha: 1.0)
    }
    
    struct Text {
        static let authDescription = "Youtube도 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인됩니다."
    }
    
    struct Figure {
        static let leftSpacing = 24
        static let rightSpacing = 24
    }
}

final class CommonAuthView: UIView {
    // MARK: - UI Components
    /**
        라벨
     */
    private var logoLabel = UILabel().then {
        $0.text = "Google"
        $0.textColor = Const.Color.googleBlue
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 44, weight: .bold)
    }
    private var titleLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
    }
    private var descriptionLabel = UILabel().then {
        $0.text = Const.Text.authDescription
        $0.textColor = .systemGray
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines = 0
    }
    
    /**
        텍스트 필드
     */
    private var nameTextField = CommonTextField(placeholder: TextFieldType.name.placeholderText)
    private var contactTextField = CommonTextField(placeholder: TextFieldType.contact.placeholderText)
    private var passwordTextField = CommonTextField(placeholder: TextFieldType.password.placeholderText,
                                                    textFieldType: .password)
    
    /**
        버튼
     */
    private lazy var passwordToggleButton = UIButton().then {
        $0.setTitle("비밀번호 표시", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
        $0.setImage(UIImage(systemName: "square"), for: .normal)
        $0.tintColor = .darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .leading
    }
    private lazy var signUpButton = UIButton().then {
        $0.setTitle("계정만들기", for: .normal)
        $0.setTitleColor(Const.Color.googleBlue, for: .normal)
        $0.contentHorizontalAlignment = .leading
    }
    private lazy var confirmButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = Const.Color.googleBlue
        $0.layer.cornerRadius = 10
    }
    
    /**
        스택 뷰
     */
    private lazy var textFieldStackView = UIStackView().then {
        $0.addArrangedSubviews(nameTextField, contactTextField, passwordTextField)
        $0.axis = .vertical
        $0.spacing = 15
    }
    private lazy var buttonStackView = UIStackView().then {
        $0.addArrangedSubviews(signUpButton, confirmButton)
        $0.axis = .horizontal
        $0.spacing = 152
    }
    
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 초기화 코드 작성 - View Instance 생성 시에 초기화 되어야 할 요소들
        setupAttributes()
        setupLayout()
        setupButtonActions()
        setupTextFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ type: AuthType) {
        self.init()
        type == .SignIn ? setupSignInView() : setupSignUpView()
    }
    
    private func setupAttributes() {
        backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        self.addSubviews(
            logoLabel, titleLabel, descriptionLabel,
            textFieldStackView, passwordToggleButton, buttonStackView
        )
        
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.left.equalToSuperview().offset(Const.Figure.leftSpacing)
            $0.right.equalToSuperview().inset(Const.Figure.rightSpacing)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(Const.Figure.leftSpacing)
            $0.right.equalToSuperview().inset(Const.Figure.rightSpacing)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.left.equalToSuperview().offset(Const.Figure.leftSpacing)
            $0.right.equalToSuperview().inset(Const.Figure.rightSpacing)
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            $0.left.equalToSuperview().offset(Const.Figure.leftSpacing)
            $0.right.equalToSuperview().inset(Const.Figure.rightSpacing)
        }
        
        [nameTextField, contactTextField, passwordTextField].forEach { textField in
            textField.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        
        passwordToggleButton.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(Const.Figure.leftSpacing)
            $0.right.equalToSuperview().inset(Const.Figure.rightSpacing)
        }
        
        confirmButton.snp.makeConstraints {
            $0.width.equalTo(80).priority(750)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(80)
            $0.left.equalToSuperview().offset(Const.Figure.leftSpacing)
            $0.right.equalToSuperview().inset(Const.Figure.rightSpacing)
            $0.height.equalTo(45)
        }
    }
    
    private func setupSignInView() {
        titleLabel.text = AuthType.SignIn.title
        descriptionLabel.textColor = .systemGray
        passwordToggleButton.isHidden = true
        signUpButton.isHidden = false
    }
    
    private func setupSignUpView() {
        titleLabel.text = AuthType.SignUp.title
        descriptionLabel.textColor = .clear
        passwordToggleButton.isHidden = false
        signUpButton.isHidden = true
    }
    
    private func setupButtonActions() {
        
    }
    
    private func setupTextFields() {
        [nameTextField, contactTextField, passwordTextField]
            .forEach { $0.delegate = self }
    }
}

// MARK: - TextField Delegate
extension CommonAuthView: UITextFieldDelegate {}
