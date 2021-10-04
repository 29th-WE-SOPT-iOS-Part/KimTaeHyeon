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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var displayPasswordButton: UIButton!
    
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    public var createAccountButtonClosure: (() ->  Void)?
    public var nextButtonClosure: (() ->  Void)?
    
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
    }
    
    private func initView() {
        guard let view = Bundle.main.loadNibNamed("SignFormView", owner: self, options: nil)?.first as? UIView else {
            return
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    private func setupAttributes(_ category: SignForm) {
        for subview in inputStackView.arrangedSubviews {
            subview.layer.cornerRadius = 10
        }
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
    }
    
    @objc
    private func tapCreateAccountButton() {
        createAccountButtonClosure?()
    }
    
    @objc
    private func tapNextButton() {
        nextButtonClosure?()
    }
}
