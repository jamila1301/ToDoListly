//
//  OnboardingViewModel.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 11.11.24.
//

import Foundation

class OnboardingViewModel {

    var onGetStartedTapped: (() -> Void)?
    
    var titleText: String {
        return "ToDoListly"
    }
    
    var welcomeText: String {
        return "Welcome to ToDoListly"
    }
    
    var subtitleText: String {
        return "Achieve your goals,\none task at a time."
    }
    
    var buttonText: String {
        return "Get Started"
    }
    
    func getStartedTapped() {
        onGetStartedTapped?()
    }
}
