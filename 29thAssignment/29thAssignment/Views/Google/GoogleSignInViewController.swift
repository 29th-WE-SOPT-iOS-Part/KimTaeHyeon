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
    private var signFormView: SignFormView = SignFormView(.SignIn)
    
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
        view.addSubview(signFormView)
        signFormView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupAction() {
        signFormView.createAccountButtonClosure = {
            let signUpVC = GoogleSignUpViewController()
            self.navigationController?.pushViewController(signUpVC, animated: true)
        }
        signFormView.nextButtonClosure = {
            let confirmVC = GoogleConfirmViewController()
            confirmVC.name = self.signFormView.getName()
            confirmVC.modalPresentationStyle = .overFullScreen
            self.present(confirmVC, animated: true, completion: nil)
        }
    }
}
