//
//  LoginViewController.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 12.11.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private let viewModel = LoginViewModel()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupActions()
    }
    
    private func setupDelegates() {
        viewModel.delegate = self
    }
    
    private func setupActions() {
        loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        loginView.signupButton.addTarget(self, action: #selector(didTapSignupButton), for: .touchUpInside)
        
        loginView.emailTextField.addTarget(self, action: #selector(emailDidChange), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
        
        if let passwordToggle = loginView.passwordTextField.rightView as? UIButton {
            passwordToggle.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        }
    }
    
    @objc private func didTapLoginButton() {
        viewModel.performLogin()
    }
    
    @objc private func didTapSignupButton() {
        let signupVC = SignupViewController()
        signupVC.modalPresentationStyle = .fullScreen
        present(signupVC, animated: true)
    }
    
    @objc private func emailDidChange() {
        viewModel.setInput(email: loginView.emailTextField.text ?? "", password: loginView.passwordTextField.text ?? "")
    }
    
    @objc private func passwordDidChange() {
        viewModel.setInput(email: loginView.emailTextField.text ?? "", password: loginView.passwordTextField.text ?? "")
    }
    
    @objc private func togglePasswordVisibility() {
        let isCurrentlySecure = loginView.passwordTextField.isSecureTextEntry
        loginView.passwordTextField.isSecureTextEntry = !isCurrentlySecure
        
        if let button = loginView.passwordTextField.rightView as? UIButton {
            let imageName = isCurrentlySecure ? "eye" : "eye.slash"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func didUpdateValidation(emailError: String?, passwordError: String?) {
        loginView.emailErrorLabel.text = emailError
        loginView.emailErrorLabel.isHidden = emailError == nil
        loginView.emailTextField.layer.borderWidth = emailError == nil ? 0 : 1
        loginView.emailTextField.layer.borderColor = emailError == nil ? UIColor.clear.cgColor : UIColor.red.cgColor
        
        loginView.passwordErrorLabel.text = passwordError
        loginView.passwordErrorLabel.isHidden = passwordError == nil
        loginView.passwordTextField.layer.borderWidth = passwordError == nil ? 0 : 1
        loginView.passwordTextField.layer.borderColor = passwordError == nil ? UIColor.clear.cgColor : UIColor.red.cgColor
    }
    
    func didUpdateLoginState(isLoading: Bool) {
        loginView.loginButton.isEnabled = !isLoading
    }
    
    func didLoginSuccessfully(userId: String) {
        let homeVC = HomeViewController(userId: userId)
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    
    func didFailLogin(with error: String) {
        loginView.passwordErrorLabel.text = error
        loginView.passwordErrorLabel.isHidden = false
        loginView.passwordTextField.layer.borderWidth = 1
        loginView.passwordTextField.layer.borderColor = UIColor.red.cgColor
    }
}
