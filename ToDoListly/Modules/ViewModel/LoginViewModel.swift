//
//  LoginViewModel.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 12.11.24.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelDelegate: AnyObject {
    func didUpdateValidation(emailError: String?, passwordError: String?)
    func didUpdateLoginState(isLoading: Bool)
    func didLoginSuccessfully(userId: String)
    func didFailLogin(with error: String)
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    
    private var email: String = ""
    private var password: String = ""
    private var shouldValidate: Bool = false
    
    private var emailError: String? = nil
    private var passwordError: String? = nil
    
    func setInput(email: String, password: String) {
        self.email = email
        self.password = password
        if shouldValidate {
            validateInput()
        }
    }
    
    private func validateInput() {
        emailError = nil
        passwordError = nil
        
        if email.isEmpty {
            emailError = "Email field cannot be left blank"
        } else if !isValidEmail(email) {
            emailError = "Please enter a valid email address"
        }
        
        if password.isEmpty {
            passwordError = "Password field cannot be left blank"
        }
        
        delegate?.didUpdateValidation(emailError: emailError, passwordError: passwordError)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    func performLogin() {
        shouldValidate = true
        validateInput()
        
        guard emailError == nil, passwordError == nil else {
            delegate?.didUpdateValidation(emailError: emailError, passwordError: passwordError)
            return
        }
        
        delegate?.didUpdateLoginState(isLoading: true)
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            self?.delegate?.didUpdateLoginState(isLoading: false)
            
            if error != nil {
                self?.delegate?.didFailLogin(with: "Invalid email or password")
                return
            }
            
            if let userId = authResult?.user.uid {
                self?.delegate?.didLoginSuccessfully(userId: userId)
            }
        }
    }
}
