//
//  GoogleSignUpViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

import FirebaseAuth
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        signUpView.clearTextFields()
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
        signUpView.confirmButton.press { [weak self] in
            self?.signUpAction()
        }
    }
    
    // ✨ 실제 로그인하는 부분 (4주차 과제)
    private func signUpAction() {
        guard let userInfo = signUpView.userInfo() else { return }
        print(userInfo.password)
        
        APIClient.request(CommonResponse<AuthResponse>.self,
                          router: .signUp(signUpRequest: userInfo)) { [weak self] models in
            print(models)
        } failure: { error in
            print(error)
        }
    }

    private func signUpActionWithFirebase() {
        guard let userInfo = signUpView.userInfo() else { return }
        FirebaseAuth.Auth.auth().createUser(withEmail: userInfo.email, password: userInfo.password) { [weak self] (result, error) in
            if error != nil {
                print("회원가입 실패")
            } else {
                self?.goToConfirmVC()
            }
        }
    }
    
    private func goToConfirmVC() {
        let confirmVC = GoogleConfirmViewController()
        confirmVC.name = self.signUpView.name()
        confirmVC.modalPresentationStyle = .fullScreen
        self.present(confirmVC, animated: true, completion: nil)
    }
}
