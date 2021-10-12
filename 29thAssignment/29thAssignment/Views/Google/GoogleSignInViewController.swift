//
//  GoogleSignInViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

import SnapKit

class GoogleSignInViewController: UIViewController {
    
    // MARK: - Properties
    private var signInView = CommonAuthView(.SignIn)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
        setupAction()
    }
    
    // MARK: - Setup Functions
    private func setupAttribute() {
        setupNavigationBar()
    }
    
    private func setupLayout() {
        view.addSubview(signInView)
        signInView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupAction() {
        signInView.signUpButton.press { [weak self] in
            let signUpVC = GoogleSignUpViewController()
            self?.navigationController?.pushViewController(signUpVC, animated: true)
        }
        
        signInView.confirmButton.press { [weak self] in
            let confirmVC = GoogleConfirmViewController()
            confirmVC.name = self?.signInView.name()
            confirmVC.modalPresentationStyle = .fullScreen
            self?.present(confirmVC, animated: true, completion: nil)
        }
    }
}
