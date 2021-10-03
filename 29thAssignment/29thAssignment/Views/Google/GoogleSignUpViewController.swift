//
//  GoogleSignUpViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

class GoogleSignUpViewController: UIViewController {

    private var signFormView: UIView = SignFormView(.SignUp)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttributes()
        setupLayout()
    }
    
    private func setupAttributes() {
        setupNavigationBar()
    }
    
    private func setupLayout() {
        view.addSubview(signFormView)
        signFormView.translatesAutoresizingMaskIntoConstraints = false
        signFormView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        signFormView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        signFormView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        signFormView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
}
