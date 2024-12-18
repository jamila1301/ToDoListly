//
//  SignupViewModel.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 13.11.24.
//

import Foundation
import FirebaseAuth

protocol SignupViewModelDelegate: AnyObject {
    func signupSucceeded(userId: String)
    func showError(message: String, for field: ValidationField)
    func clearErrors()
}

enum ValidationField {
    case email
    case password
}

class SignupViewModel {
    
    weak var delegate: SignupViewModelDelegate?
    
    func validateAndSignup(email: String, password: String) {
        delegate?.clearErrors()
        
        guard validateFields(email: email, password: password) else { return }
        createUser(email: email, password: password)
    }
    
    private func validateFields(email: String, password: String) -> Bool {
        var isValid = true
        
        if email.isEmpty {
            delegate?.showError(message: "Email field cannot be left blank", for: .email)
            isValid = false
        } else if !isValidEmail(email) {
            delegate?.showError(message: "Please enter a valid email address", for: .email)
            isValid = false
        }
        
        if password.isEmpty {
            delegate?.showError(message: "Password field cannot be left blank", for: .password)
            isValid = false
        } else if password.count < 8 {
            delegate?.showError(message: "Password must be at least 8 characters", for: .password)
            isValid = false
        } else if let passwordError = validatePassword(password) {
            delegate?.showError(message: passwordError, for: .password)
            isValid = false
        } else if password.contains(" ") {
            delegate?.showError(message: "Password must not contain spaces", for: .password)
            isValid = false
        }
        
        return isValid
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    private func validatePassword(_ password: String) -> String? {
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let numberRegEx = ".*[0-9]+.*"
        let specialCharRegEx = ".*[!@#$%^&*(),.?\":{}|<>]+.*"
        
        if !NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx).evaluate(with: password) {
            return "Password must contain at least one uppercase letter"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", numberRegEx).evaluate(with: password) {
            return "Password must contain at least one number"
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", specialCharRegEx).evaluate(with: password) {
            return "Password must contain at least one special character"
        }
        
        return nil
    }
    
    private func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                if let errorCode = AuthErrorCode(rawValue: error._code) {
                    switch errorCode {
                    case .emailAlreadyInUse:
                        self?.delegate?.showError(message: "Login is available with this email", for: .email)
                    default:
                        self?.delegate?.showError(message: "An unexpected error occurred", for: .email)
                    }
                }
                return
            }
            
            if let userId = authResult?.user.uid {
                self?.delegate?.signupSucceeded(userId: userId)
            }
        }
    }
}
