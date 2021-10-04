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
    private var signFormView: SignFormView = SignFormView(.SignUp)

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
        signFormView.nextButtonClosure = {
            let confirmVC = GoogleConfirmViewController()
            confirmVC.name = self.signFormView.getName()
            self.present(confirmVC, animated: true, completion: nil)
        }
    }
}
