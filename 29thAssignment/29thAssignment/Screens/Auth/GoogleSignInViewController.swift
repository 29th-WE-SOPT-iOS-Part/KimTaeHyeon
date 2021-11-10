//
//  GoogleSignInViewController.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

import FirebaseAuth
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        signInView.clearTextFields()
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
            self?.goToSignUpVC()
        }
        
        signInView.confirmButton.press { [weak self] in
            self?.signInAction()
        }
    }
    
    // ✨ 실제 로그인하는 부분 (4주차 과제)
    private func signInAction() {
        guard let userInfo = signInView.userInfo() else { return }
        APIClient.request(CommonResponse<AuthResponse>.self,
                          router: .signIn(signInRequest: userInfo)) { [weak self] models in
            guard let self = self else { return }
            self.judgeSignIn(success: models.success, message: models.message, username: models.data?.name)
        } failure: { error in
            print(error)
        }
    }
    
    // ✨ 로그인 성공 여부 판단
    private func judgeSignIn(success: Bool, message: String, username: String?) {
        if success {
            storeUsername(username: username)
            alertWithOkAction(title: "로그인", message: message) { [weak self] _ in
                guard let self = self else { return }
                self.goToConfirmVC()
            }
        } else {
            alertWithOkAction(title: "로그인", message: message, alertCompletion: nil)
        }
    }
    
    // ⭐️ 도전과제 UserDefaults
    private func storeUsername(username: String?) {
        if let username = username {
            UserDefaults.standard.set(username, forKey: Key.username)
        }
    }
    
    private func signInActionWithFirebase() {
        guard let userInfo = signInView.userInfo() else { return }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { [weak self] (user, error) in
            guard let self = self else { return }
            
            if let error = error, user == nil {
                let alert = UIAlertController(title: "로그인 실패", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.goToConfirmVC()
            }
        }
    }
    
    private func goToConfirmVC() {
        let confirmVC = GoogleConfirmViewController()
        confirmVC.modalPresentationStyle = .fullScreen
        show(confirmVC, sender: self)
    }
    
    private func goToSignUpVC() {
        let signUpVC = GoogleSignUpViewController()
        show(signUpVC, sender: self)
    }
}
