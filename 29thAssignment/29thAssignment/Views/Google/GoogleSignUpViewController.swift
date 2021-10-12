//
//  GoogleSignUpViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

import SnapKit

class GoogleSignUpViewController: UIViewController {

    // MARK: - Properties
    private var signUpView = CommonAuthView(.SignUp)

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
        view.addSubview(signUpView)
        signUpView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupAction() {
        signUpView.confirmButton.press {
            let confirmVC = GoogleConfirmViewController()
            confirmVC.name = self.signUpView.name()
            confirmVC.modalPresentationStyle = .fullScreen
            self.present(confirmVC, animated: true, completion: nil)
        }
    }
}
