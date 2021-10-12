//
//  CommonAuthView.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/09.
//

import UIKit

import SnapKit
import Then

struct Const {
    struct Color {
        static let googleBlue = UIColor(red: 66/255.0, green: 133/255.0, blue: 244/255.0, alpha: 1.0)
    }
    
    struct Text {
        static let authDescription = "Youtube도 이동하며 계속하세요. 앱 및 Safari에서도 Google 서비스에 로그인됩니다."
    }
    
    struct Figure {
        static let guidePadding = 24
        static let leftPadding = 24
        static let rightPadding = 24
    }
    
    struct Image {
        static let checkmarkFill = UIImage(systemName: "checkmark.square.fill")
        static let checkmarkEmpty = UIImage(systemName: "square")
    }
}

final class CommonAuthView: UIView {
    // MARK: - Enum
    
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
    
    enum ButtonType {
        case SignIn
        case Confirm
    }
    
    // MARK: - UI Components
    /**
        라벨
     */
    private var logoLabel = UILabel().then {
        $0.text = "Google"
        $0.textColor = Const.Color.googleBlue
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 44)
    }
    private var titleLabel = UILabel().then {
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
    private var nameTextField = CommonTextField(placeholder: TextFieldType.name.placeholder)
    private var contactTextField = CommonTextField(placeholder: TextFieldType.contact.placeholder)
    private var passwordTextField = CommonTextField(placeholder: TextFieldType.password.placeholder,
                                                    textFieldType: .password)
    
    /**
        버튼
     */
    private lazy var passwordToggleButton = UIButton().then {
        $0.setTitle("비밀번호 표시", for: .normal)
        $0.setTitleColor(.darkGray, for: .normal)
        $0.setImage(Const.Image.checkmarkEmpty, for: .normal)
        $0.tintColor = .darkGray
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .leading
    }
    lazy var signUpButton = UIButton().then {
        $0.setTitle("계정만들기", for: .normal)
        $0.setTitleColor(Const.Color.googleBlue, for: .normal)
        $0.contentHorizontalAlignment = .leading
    }
    lazy var confirmButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.isEnabled = false
        $0.backgroundColor = .lightGray
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
    
    // MARK: - Properties
    
    private var passwordSecureFlag: Bool = false {
        didSet {
            passwordSecureFlag ?
            passwordToggleButton.setImage(Const.Image.checkmarkFill, for: .normal) : passwordToggleButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 초기화 코드 작성 - View Instance 생성 시에 초기화 되어야 할 요소들
        setupAttributes()
        setupLayout()
        setupTextFields()
        setupButtonActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ type: AuthType) {
        self.init()
        type == .SignIn ? setupSignInView() : setupSignUpView()
    }
    
    // MARK: - Setup
    
    private func setupAttributes() {
        backgroundColor = .systemBackground
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
    
    private func setupTextFields() {
        [nameTextField, contactTextField, passwordTextField].forEach {
            $0.delegate = self
            $0.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    private func setupButtonActions() {
        passwordToggleButton.press { [weak self] in
            self?.passwordSecureFlag.toggle()
        }
    }
    
    // MARK: - Public Functions
    
    public func name() -> String {
        guard let name = nameTextField.text else { return "알 수 없음" }
        return name.isEmpty ? "알 수 없음" : name
    }
    
    // MARK: - Objc Functions

    @objc
    func textFieldDidChange(_ textField: UITextField) {
        let hasTextInAllTextFields = nameTextField.hasText && contactTextField.hasText && passwordTextField.hasText
        confirmButton.isEnabled = hasTextInAllTextFields
        confirmButton.backgroundColor = hasTextInAllTextFields ? Const.Color.googleBlue : . lightGray
    }
}

// MARK: - Setup Layout
/**
 코드로 작성하다보면 해당 부분의 길이가 길어지는 경향이 있다.
 다른 부분의 프로퍼티나 함수를 확인하는데에 어려움이 있어 따로 영역을 빼놓았다.
 */
extension CommonAuthView {
    private func setupLayout() {
        self.addSubviews(
            logoLabel, titleLabel, descriptionLabel,
            textFieldStackView, passwordToggleButton, buttonStackView
        )
        
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.guidePadding)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.guidePadding)
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.guidePadding)
        }
        
        [nameTextField, contactTextField, passwordTextField].forEach { textField in
            textField.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        
        passwordToggleButton.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.guidePadding)
        }
        
        confirmButton.snp.makeConstraints {
            $0.width.equalTo(80).priority(750)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(80)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.guidePadding)
            $0.height.equalTo(45)
        }
    }
}

// MARK: - TextField Delegate

extension CommonAuthView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField: contactTextField.becomeFirstResponder()
        case contactTextField: passwordTextField.becomeFirstResponder()
        case passwordTextField: passwordTextField.resignFirstResponder()
        default: break
        }
        return true
    }
}
