//
//  SignFormView.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/04.
//

import UIKit

enum SignForm {
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

final class SignFormView: UIView {
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var displayPasswordButton: UIButton!
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    public var createAccountButtonClosure: (() ->  Void)?
    public var nextButtonClosure: (() ->  Void)?
    private var passwordToggleFlag: Bool = false {
        didSet {
            passwordTextField.isSecureTextEntry.toggle()
            if passwordToggleFlag {
                displayPasswordButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            } else {
                displayPasswordButton.setImage(UIImage(systemName: "square"), for: .normal)
            }
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ category: SignForm) {
        self.init()
        setupAttributes(category)
        setupTextFields()
    }
    
    private func initView() {
        guard let view = Bundle.main.loadNibNamed("SignFormView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    // MARK: - Setup Functions
    private func setupAttributes(_ category: SignForm) {
        for subview in inputStackView.arrangedSubviews {
            subview.layer.cornerRadius = 10
        }
        
        nextButton.isEnabled = false
        nextButton.backgroundColor = .darkGray
        nextButton.layer.cornerRadius = 10
        
        titleLabel.text = category.title
        switch category {
        case .SignIn:
            setupSignInView()
        case .SignUp:
            setupSignUpView()
        }
    }
    
    private func setupSignInView() {
        descriptionLabel.textColor = .systemGray
        displayPasswordButton.isHidden = true
        createAccountButton.isHidden = false
    }
    
    private func setupSignUpView() {
        descriptionLabel.textColor = .clear
        displayPasswordButton.isHidden = false
        createAccountButton.isHidden = true
    }
    
    private func setupActions() {
        createAccountButton.addTarget(self, action: #selector(tapCreateAccountButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        displayPasswordButton.addTarget(self, action: #selector(tapDisplayPasswordButton), for: .touchUpInside)
    }
    
    private func setupTextFields() {
        passwordTextField.isSecureTextEntry = true
        [nameTextField, contactTextField, passwordTextField].forEach { $0?.delegate = self }
    }
    
    // MARK: - Public Functions
    public func getName() -> String {
        guard let name = nameTextField.text else { return "알 수 없음"}
        return name.isEmpty ? "알 수 없음" : name
    }
    
    // MARK: - Objc Functions
    @objc
    private func tapCreateAccountButton() {
        createAccountButtonClosure?()
    }
    
    @objc
    private func tapNextButton() {
        nextButtonClosure?()
    }
    
    @objc
    private func tapDisplayPasswordButton() {
        passwordToggleFlag.toggle()
    }
}

extension SignFormView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let isNameEmpty = nameTextField.text?.isEmpty else { return }
        guard let isContactEmpty = contactTextField.text?.isEmpty else { return }
        guard let isPasswordEmpty = passwordTextField.text?.isEmpty else { return }
        
        if isNameEmpty || isContactEmpty || isPasswordEmpty {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .darkGray
        } else {
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
        }
    }
    
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
