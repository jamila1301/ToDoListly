//
//  UpdateTaskDialogViewController.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 23.11.24.
//

import UIKit

class UpdateTaskDialogViewController: UIViewController {
    
    private let updateTaskDialogView = UpdateTaskDialogView()
    private var viewModel: UpdateTaskViewModel

    init(viewModel: UpdateTaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupDialogView()
        setupActions()
    }

    private func setupDialogView() {
        view.addSubview(updateTaskDialogView)

        updateTaskDialogView.center = view.center
        updateTaskDialogView.taskTextField.text = viewModel.taskTitle

        updateTaskDialogView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            updateTaskDialogView.widthAnchor.constraint(equalToConstant: 300),
            updateTaskDialogView.heightAnchor.constraint(equalToConstant: 200),
            updateTaskDialogView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateTaskDialogView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupActions() {
        updateTaskDialogView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        updateTaskDialogView.updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func updateButtonTapped() {
        guard let updatedText = updateTaskDialogView.taskTextField.text else { return }
        if viewModel.updateTask(with: updatedText) {
            dismiss(animated: true, completion: nil)
        }
    }
}
