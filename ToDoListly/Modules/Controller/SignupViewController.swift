//
//  SignupViewController.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 13.11.24.
//

import UIKit

class SignupViewController: UIViewController {
    
    private let signupView = SignupView()
    private let viewModel = SignupViewModel()
    
    override func loadView() {
        self.view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupPasswordVisibilityToggle()
        viewModel.delegate = self
    }
    
    private func setupActions() {
        signupView.loginButton.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        signupView.signupButton.addTarget(self, action: #selector(signupUser), for: .touchUpInside)
    }
    
    private func setupPasswordVisibilityToggle() {
        signupView.passwordTextField.rightView?.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
        )
    }
    
    @objc private func togglePasswordVisibility() {
        signupView.passwordTextField.isSecureTextEntry.toggle()
        let imageName = signupView.passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        if let button = signupView.passwordTextField.rightView as? UIButton {
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    @objc private func signupUser() {
        guard let email = signupView.emailTextField.text,
              let password = signupView.passwordTextField.text else { return }
        
        viewModel.validateAndSignup(email: email, password: password)
    }
    
    @objc private func navigateToLogin() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
}

extension SignupViewController: SignupViewModelDelegate {
    func signupSucceeded(userId: String) {
        let homeVC = HomeViewController(userId: userId)
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    
    func showError(message: String, for field: ValidationField) {
        switch field {
        case .email:
            signupView.emailTextField.layer.borderWidth = 1
            signupView.emailTextField.layer.borderColor = UIColor.redColor.cgColor
            signupView.emailErrorLabel.text = message
            signupView.emailErrorLabel.isHidden = false
            
        case .password:
            signupView.passwordTextField.layer.borderWidth = 1
            signupView.passwordTextField.layer.borderColor = UIColor.redColor.cgColor
            signupView.passwordErrorLabel.text = message
            signupView.passwordErrorLabel.isHidden = false
        }
    }
    
    func clearErrors() {
        signupView.emailTextField.layer.borderWidth = 0
        signupView.emailErrorLabel.isHidden = true
        
        signupView.passwordTextField.layer.borderWidth = 0
        signupView.passwordErrorLabel.isHidden = true
    }
}
