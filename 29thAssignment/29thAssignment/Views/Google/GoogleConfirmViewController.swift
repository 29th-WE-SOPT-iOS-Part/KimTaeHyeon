//
//  GoogleConfirmViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

import SnapKit
import Then

class GoogleConfirmViewController: UIViewController {
    
    // MARK: - Properties
    var name: String?
    
    // MARK: - UI Properties
    
    private var logoImageView = UIImageView().then {
        $0.image = Const.Image.logo
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let messageLabel = UILabel().then {
        $0.font = TextStyle.welcomeMessage.font
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private lazy var confirmButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = TextStyle.buttonFill.font
        $0.backgroundColor = Const.Color.googleBlue
        $0.layer.cornerRadius = 4
        $0.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
    }
    
    let signInWithAnotherAccountButton = UIButton().then {
        $0.setTitle("다른 계정으로 로그인하기", for: .normal)
        $0.setTitleColor(Const.Color.googleBlue, for: .normal)
        $0.titleLabel?.font = TextStyle.buttonPlain.font
        $0.addTarget(self, action: #selector(signInWithAnotherAccountButtonDidTap), for: .touchUpInside)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
        setupMessage()
    }

    // MARK: - Setup Functions
    private func setupAttribute() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupLayout() {
        
        view.addSubviews(logoImageView, messageLabel, confirmButton, signInWithAnotherAccountButton)
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(248)
            $0.width.equalTo(118)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(messageLabel.snp.bottom).offset(53)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.sidePadding)
            $0.height.equalTo(42)
        }
        
        signInWithAnotherAccountButton.snp.makeConstraints {
            $0.top.equalTo(confirmButton.snp.bottom).offset(23)
            $0.leading.trailing.equalToSuperview().inset(Const.Figure.sidePadding) // 터치 영역을 고려해서 너비를 늘림.
            $0.height.equalTo(22)
        }
    }
    
    // MARK: - Private Functions
    private func setupMessage() {
        if let name = self.name {
            messageLabel.text = "\(name)님\n환영합니다!"
        }
    }
    
    // MARK: - Objc Functions
    @objc
    private func confirmButtonDidTap() {
        // 이 부분은 전역함수, 익스텐션으로 만들어놓아도 될 것 같음
        guard let window = self.view.window else { return }
        
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 0.2
        
        window.layer.add(transition, forKey: kCATransition)
        window.rootViewController = BaseTabBarController()
        window.makeKeyAndVisible()
    }
    
    @objc
    func signInWithAnotherAccountButtonDidTap() {
        guard let parentVC = presentingViewController as? UINavigationController else { return }
        dismiss(animated: true) {
            parentVC.popToRootViewController(animated: true)
        }
    }
}
