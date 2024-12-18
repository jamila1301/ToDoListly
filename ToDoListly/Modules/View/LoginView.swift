//
//  LoginView.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 12.11.24.
//

import UIKit

class LoginView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.font = UIFont(name: "Poppins-SemiBold", size: 30)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back to the app"
        label.font = UIFont(name: "Poppins-Regular", size: 18)
        label.textColor = .greyColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address"
        label.font = UIFont(name: "Poppins-Regular", size: 20)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
        textField.font = UIFont(name: "Poppins-Regular", size: 16)
        textField.textColor = .blackColor
        textField.backgroundColor = .lightGreyColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .redColor
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Poppins-Regular", size: 20)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.font = UIFont(name: "Poppins-Regular", size: 16)
        textField.textColor = .blackColor
        textField.backgroundColor = .lightGreyColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(10)
        
        let passwordToggle = UIButton(type: .custom)
        passwordToggle.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        passwordToggle.tintColor = .blueColor
        textField.rightView = passwordToggle
        textField.rightViewMode = .always
        return textField
    }()
    
    let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .redColor
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 20)
        button.setTitleColor(.whiteColor, for: .normal)
        button.backgroundColor = .blueColor
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Don\'t have an account?"
        label.font = UIFont(name: "Poppins-Regular", size: 18)
        label.textColor = .greyColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 18)
        button.setTitleColor(.blueColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .whiteColor
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(emailErrorLabel)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(passwordErrorLabel)
        addSubview(loginButton)
        addSubview(signupLabel)
        addSubview(signupButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let sidePadding = UIScreen.main.bounds.width * 0.06
        let verticalSpacing = UIScreen.main.bounds.height * 0.025
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: verticalSpacing * 2),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalSpacing),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: verticalSpacing * 2),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: verticalSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding),
            emailTextField.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06),
            
            emailErrorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4),
            emailErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: verticalSpacing * 1.5),
            passwordLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: verticalSpacing),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            passwordErrorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 4),
            passwordErrorLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: verticalSpacing * 1.5),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            signupLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: verticalSpacing),
            signupLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -40),
            
            signupButton.centerYAnchor.constraint(equalTo: signupLabel.centerYAnchor),
            signupButton.leadingAnchor.constraint(equalTo: signupLabel.trailingAnchor, constant: 4)
        ])
    }
}
