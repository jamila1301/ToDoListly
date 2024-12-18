//
//  OnboardingViewController.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 11.11.24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let onboardingView = OnboardingView()
    private let viewModel = OnboardingViewModel()
    
    var onFinish: (() -> Void)?
    
    override func loadView() {
        self.view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupUI()
    }
    
    private func setupUI() {
        onboardingView.configure(with: viewModel)
    }
    
    private func setupBindings() {
        onboardingView.getStartedButton.addTarget(self,
            action: #selector(getStartedTapped),
            for: .touchUpInside)
        
        viewModel.onGetStartedTapped = { [weak self] in
            self?.onFinish?()
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self?.present(loginVC, animated: true)
        }
    }
    
    @objc private func getStartedTapped() {
        viewModel.getStartedTapped()
    }
}
