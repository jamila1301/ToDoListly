//
//  HomeViewController.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 20.11.24.
//

import UIKit
import FirebaseAuth
import CoreData

class HomeViewController: UIViewController {

    private let homeView = HomeView()
    private let viewModel: HomeViewModel
    
    init(userId: String) {
        self.viewModel = HomeViewModel(userId: userId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupActions()
        setupTableView()
        viewModel.loadTasks()
    }
    
    private func setupBindings() {
        viewModel.tasksUpdateCallback = { [weak self] in
            self?.homeView.updateTasks(self?.viewModel.tasks ?? [])
        }
        
        viewModel.pendingStatusCallback = { [weak self] isPending in
            self?.homeView.updateTaskListStyle(isPendingSelected: isPending)
        }
        
        viewModel.navigateToLoginCallback = { [weak self] in
            self?.navigateToLogin()
        }
    }
    
    private func setupActions() {
        homeView.logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        homeView.pendingButton.addTarget(self, action: #selector(pendingButtonTapped), for: .touchUpInside)
        homeView.completedButton.addTarget(self, action: #selector(completedButtonTapped), for: .touchUpInside)
        homeView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    private func setupTableView() {
        homeView.taskTableView.dataSource = self
        homeView.taskTableView.delegate = self
        homeView.taskTableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
    }
    
    @objc private func logoutButtonTapped() {
        viewModel.logout()
    }
    
    @objc private func pendingButtonTapped() {
        if !viewModel.isShowingPendingTasks {
            viewModel.toggleTaskList()
        }
    }
    
    @objc private func completedButtonTapped() {
        if viewModel.isShowingPendingTasks {
            viewModel.toggleTaskList()
        }
    }
    
    @objc private func addButtonTapped() {
        let addTaskVC = AddTaskDialogViewController()
        addTaskVC.modalPresentationStyle = .overCurrentContext
        addTaskVC.onAddTask = { [weak self] taskText in
            self?.viewModel.addTask(title: taskText)
        }
        present(addTaskVC, animated: true)
    }
    
    private func navigateToLogin() {
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = viewModel.tasks[indexPath.row]
        
        let taskView = UIView()
        taskView.backgroundColor = .softGreyColor
        taskView.layer.cornerRadius = 5
        taskView.translatesAutoresizingMaskIntoConstraints = false

        let taskLabel = UILabel()
        taskLabel.text = task.title
        taskLabel.numberOfLines = 0
        taskLabel.lineBreakMode = .byWordWrapping
        taskLabel.translatesAutoresizingMaskIntoConstraints = false

        cell.contentView.addSubview(taskView)
        taskView.addSubview(taskLabel)

        NSLayoutConstraint.activate([
            taskView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16),
            taskView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            taskView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
            taskView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10),

            taskLabel.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 8),
            taskLabel.trailingAnchor.constraint(equalTo: taskView.trailingAnchor, constant: -8),
            taskLabel.topAnchor.constraint(equalTo: taskView.topAnchor, constant: 8),
            taskLabel.bottomAnchor.constraint(equalTo: taskView.bottomAnchor, constant: -8)
        ])
        
        let interaction = UIContextMenuInteraction(delegate: self)
        cell.addInteraction(interaction)
        
        return cell
    }
}

extension HomeViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        guard let cell = interaction.view as? UITableViewCell,
              let indexPath = homeView.taskTableView.indexPath(for: cell) else { return nil }
        
        let task = viewModel.tasks[indexPath.row]
        
        if task.isCompleted {
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { [weak self] _ in
                self?.viewModel.deleteTask(task)
            }
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                return UIMenu(title: "", children: [deleteAction])
            }
        } else {
            let updateAction = UIAction(title: "Update", image: UIImage(systemName: "pencil")) { [weak self] _ in
                self?.presentUpdateDialog(for: task)
            }
            
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { [weak self] _ in
                self?.viewModel.deleteTask(task)
            }
            
            let completedAction = UIAction(title: "Completed", image: UIImage(systemName: "checkmark")) { [weak self] _ in
                self?.viewModel.markTaskAsCompleted(task)
            }
            
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                return UIMenu(title: "", children: [updateAction, deleteAction, completedAction])
            }
        }
    }
    
    private func presentUpdateDialog(for task: UserTask) {
        let viewModel = UpdateTaskViewModel(task: task)
        viewModel.onTaskUpdated = { [weak self] updatedText in
            self?.viewModel.updateTask(task, newTitle: updatedText)
        }
        let updateTaskVC = UpdateTaskDialogViewController(viewModel: viewModel)
        updateTaskVC.modalPresentationStyle = .overCurrentContext
        present(updateTaskVC, animated: true)
    }
}

        
        
        
