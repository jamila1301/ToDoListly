//
//  OnboardingView.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 11.11.24.
//

import UIKit

class OnboardingView: UIView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-SemiBold", size: 32)
        label.textColor = .blueColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "onboarding")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-SemiBold", size: 24)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Regular", size: 20)
        label.textColor = .greyColor
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 20)
        button.backgroundColor = .blueColor
        button.setTitleColor(.whiteColor, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configure(with viewModel: OnboardingViewModel) {
        titleLabel.text = viewModel.titleText
        welcomeLabel.text = viewModel.welcomeText
        subtitleLabel.text = viewModel.subtitleText
        getStartedButton.setTitle(viewModel.buttonText, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .whiteColor
        
        let sidePadding = UIScreen.main.bounds.width * 0.06
        let verticalSpacing = UIScreen.main.bounds.height * 0.025
        
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(subtitleLabel)
        addSubview(getStartedButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: sidePadding),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -sidePadding),
            
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            getStartedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            getStartedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding),
            getStartedButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -verticalSpacing),
            getStartedButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
