//
//  UpdateTaskDialogView.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 23.11.24.
//

import UIKit

class UpdateTaskDialogView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Update task"
        label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Update a task"
        textField.font = UIFont(name: "Poppins-Regular", size: 16)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGreyColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.setTitleColor(.whiteColor, for: .normal)
        button.backgroundColor = .blueColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        button.setTitleColor(.whiteColor, for: .normal)
        button.backgroundColor = .blueColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        layer.cornerRadius = 20
        
        addSubview(titleLabel)
        addSubview(taskTextField)
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(updateButton)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 300),
            heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            taskTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            taskTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            taskTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            taskTextField.heightAnchor.constraint(equalToConstant: 40),
            
            buttonStackView.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

