//
//  SignupView.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 13.11.24.
//

import UIKit

class SignupView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: "Poppins-SemiBold", size: 30)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont(name: "Poppins-Regular", size: 20)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.font = UIFont(name: "Poppins-Regular", size: 16)
        textField.textColor = .blackColor
        textField.backgroundColor = .lightGreyColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftPaddingPoints(10)
        return textField
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
    
    let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 20)
        button.setTitleColor(.whiteColor, for: .normal)
        button.backgroundColor = .blueColor
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.font = UIFont(name: "Poppins-Regular", size: 18)
        label.textColor = .greyColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 18)
        button.setTitleColor(.blueColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .redColor
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .redColor
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(signupButton)
        addSubview(loginLabel)
        addSubview(loginButton)
        addSubview(emailErrorLabel)
        addSubview(passwordErrorLabel)
        
        let sidePadding = UIScreen.main.bounds.width * 0.06
        let verticalSpacing = UIScreen.main.bounds.height * 0.025
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: verticalSpacing * 2),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalSpacing * 2),
            nameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: verticalSpacing),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding),
            nameTextField.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.06),
            
            emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: verticalSpacing),
            emailLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: verticalSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: verticalSpacing),
            passwordLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: verticalSpacing),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: verticalSpacing * 1.5),
            signupButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            signupButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            signupButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: verticalSpacing),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -40),
            
            loginButton.centerYAnchor.constraint(equalTo: loginLabel.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: loginLabel.trailingAnchor, constant: 4),
            
            emailErrorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4),
            emailErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            
            passwordErrorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 4),
            passwordErrorLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor)
        ])
    }
}

