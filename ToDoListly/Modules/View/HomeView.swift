//
//  HomeView.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 20.11.24.
//

import UIKit

class HomeView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ToDoListly"
        label.font = UIFont(name: "Poppins-SemiBold", size: 28)
        label.textColor = .blackColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log out", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 20)
        button.setTitleColor(.blueColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pendingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pending", for: .normal)
        button.setTitleColor(.whiteColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 20)
        button.backgroundColor = .blueColor
        button.layer.borderColor = UIColor.blueColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let completedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Completed", for: .normal)
        button.setTitleColor(UIColor.blueColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 20)
        button.backgroundColor = .whiteColor
        button.layer.borderColor = UIColor.blueColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.whiteColor, for: .normal)
        button.backgroundColor = .blueColor
        button.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 26)
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let taskTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 20
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
    
    private var tasks: [UserTask] = []
        
    func updateTasks(_ tasks: [UserTask]) {
        self.tasks = tasks
        taskTableView.reloadData()
    }
        
    func updateTaskListStyle(isPendingSelected: Bool) {
        pendingButton.backgroundColor = isPendingSelected ? .blueColor : .whiteColor
        pendingButton.setTitleColor(isPendingSelected ? .whiteColor : .blueColor, for: .normal)
            
        completedButton.backgroundColor = !isPendingSelected ? .blueColor : .whiteColor
        completedButton.setTitleColor(!isPendingSelected ? .whiteColor : .blueColor, for: .normal)
    }
    
    private func setupView() {        
        backgroundColor = .whiteColor
        
        let sidePadding = UIScreen.main.bounds.width * 0.06
        let buttonHeight: CGFloat = 60
        
        addSubview(titleLabel)
        addSubview(logoutButton)
        
        buttonStackView.addArrangedSubview(pendingButton)
        buttonStackView.addArrangedSubview(completedButton)
        
        addSubview(buttonStackView)
        addSubview(addButton)
        
        addSubview(taskTableView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: sidePadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            
            logoutButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding),
            
            buttonStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: sidePadding),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding),
            pendingButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -sidePadding),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -sidePadding),
            addButton.widthAnchor.constraint(equalToConstant: 60),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            
            taskTableView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 20),
            taskTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            taskTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            taskTableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20)
        ])
    }
}
