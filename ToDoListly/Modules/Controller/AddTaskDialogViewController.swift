//
//  AddTaskDialogViewController.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 22.11.24.
//

import UIKit

class AddTaskDialogViewController: UIViewController {

    private let dialogView = AddTaskDialogView()
    private let viewModel = AddTaskViewModel()
    var onAddTask: ((String) -> Void)?
    var taskAddedCallback: ((UserTask) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(dialogView)
        
        NSLayoutConstraint.activate([
            dialogView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dialogView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupActions() {
        dialogView.cancelButton.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        dialogView.addButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
    }
    
    private func setupBindings() {
        viewModel.onTaskAdded = { [weak self] task in
            self?.taskAddedCallback?(task)
            self?.onAddTask?(task.title ?? "")  
        }
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true)
    }
    
    @objc private func didTapAdd() {
        guard let taskText = dialogView.taskTextField.text,
              viewModel.isValidTask(taskText) else { return }
        
        if viewModel.addTask(title: taskText, userId: "currentUserId") {
            dismiss(animated: true)
        }
    }
}
