//
//  GoogleConfirmViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

import Then
import SnapKit

class GoogleConfirmViewController: UIViewController {
    
    // MARK: - Properties
    var name: String?
    
    // MARK: - UI Properties
    private let verticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
    }
    
    private let googleLabel = UILabel().then {
        $0.text = "Google"
        $0.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
    }
    
    private let messageLabel = UILabel().then {
        $0.text = "OOO님\n환영합니다!"
        $0.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private lazy var confirmButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.backgroundColor = UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
        $0.layer.cornerRadius = 10
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
        confirmButton.snp.makeConstraints { $0.height.equalTo(45) }
        verticalStackView.addArrangedSubviews(googleLabel, messageLabel, confirmButton)
        
        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-80)
        }
        verticalStackView.setCustomSpacing(60, after: messageLabel)
    }
    
    // MARK: - Private Functions
    private func setupMessage() {
        if let name = self.name {
            messageLabel.text = "\(name)님\n환영합니다!"
        }
    }
}
