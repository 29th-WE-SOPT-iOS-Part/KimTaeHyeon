//
//  CommonAuthView.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/09.
//

import UIKit

import SnapKit
import Then

struct GoogleUserInfo {
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
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
    private var logoImageView = UIImageView().then {
        $0.image = Const.Image.logo
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
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
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 0
    }
    
    /**
        텍스트 필드
     */
    private var nameTextField = BaeminStyleTextField().then {
        $0.titleText = "아이디"
        $0.activeBorderColor = Const.Color.googleBlue
    }
    private var contactTextField = BaeminStyleTextField().then {
        $0.titleText = "이메일 또는 전화번호"
        $0.activeBorderColor = Const.Color.googleBlue
    }
    private var passwordTextField = BaeminStyleTextField().then {
        $0.titleText = "비밀번호"
        $0.activeBorderColor = Const.Color.googleBlue
        $0.isSecureTextEntry = true
    }
    
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
        $0.layer.cornerRadius = 4
    }
    
    /**
        스택 뷰
     */
    private lazy var textFieldStackView = UIStackView().then {
        $0.addArrangedSubviews(nameTextField, contactTextField, passwordTextField)
        $0.axis = .vertical
        $0.spacing = Const.Figure.textFieldSpacing // 텍스트 필드 간격: 17.0
    }
    private lazy var buttonStackView = UIStackView().then {
        $0.addArrangedSubviews(signUpButton, confirmButton)
        $0.axis = .horizontal
        $0.spacing = 152
    }
    
    // MARK: - Properties
    
    private var passwordSecureFlag: Bool = false {
        didSet {
            passwordSecureFlag ? passwordToggleButton.setImage(Const.Image.checkmarkFill, for: .normal) : passwordToggleButton.setImage(UIImage(systemName: "square"), for: .normal)
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
            $0.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    private func setupButtonActions() {
        passwordToggleButton.press { [weak self] in
            self?.passwordSecureFlag.toggle()
            self?.passwordTextField.isSecureTextEntry.toggle()
        }
    }
    
    // MARK: - Public Functions
    
    public func name() -> String {
        guard let name = nameTextField.text else { return "알 수 없음" }
        return name.isEmpty ? "알 수 없음" : name
    }
    
    @discardableResult
    public func userInfo() -> GoogleUserInfo? {
        guard let name = nameTextField.text, name.isNotEmpty,
              let contact = contactTextField.text, contact.isNotEmpty,
              let password = passwordTextField.text, password.isNotEmpty  else {
                  return nil
              }
        
        return GoogleUserInfo(name: name, email: contact, password: password)
    }
    
    // MARK: - Objc Functions

    @objc
    func textFieldDidChange(_ textField: UITextField) {
        let hasTextInAllTextFields = nameTextField.hasText && contactTextField.hasText && passwordTextField.hasText
        confirmButton.isEnabled = hasTextInAllTextFields
        confirmButton.backgroundColor = hasTextInAllTextFields ? Const.Color.googleBlue : . lightGray
    }
    
    // MARK: - Overriding
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
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
            logoImageView, titleLabel, descriptionLabel,
            textFieldStackView, passwordToggleButton, buttonStackView
        )
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            $0.width.equalTo(118)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.sidePadding)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.sidePadding)
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(68)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.sidePadding)
        }
        
        [nameTextField, contactTextField, passwordTextField].forEach { textField in
            textField.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        
        passwordToggleButton.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.sidePadding)
        }
        
        confirmButton.snp.makeConstraints {
            $0.width.equalTo(74).priority(250)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(64)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.sidePadding)
            $0.height.equalTo(42)
        }
    }
}
