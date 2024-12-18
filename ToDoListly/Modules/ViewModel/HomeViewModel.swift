//
//  HomeViewModel.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 20.11.24.
//

import UIKit
import FirebaseAuth

class HomeViewModel {

    private let dataManager = DataManager.shared
    private let userId: String
    
    var tasks: [UserTask] = [] {
        didSet {
            tasksUpdateCallback?()
        }
    }
    
    var isShowingPendingTasks = true {
        didSet {
            pendingStatusCallback?(isShowingPendingTasks)
        }
    }
    
    var tasksUpdateCallback: (() -> Void)?
    var pendingStatusCallback: ((Bool) -> Void)?
    var navigateToLoginCallback: (() -> Void)?
    
    init(userId: String) {
        self.userId = userId
    }
    
    func loadTasks() {
        tasks = dataManager.fetchTasks(for: userId, isCompleted: !isShowingPendingTasks)
    }
    
    func addTask(title: String) {
        dataManager.saveTask(title: title, isCompleted: false, userId: userId)
        loadTasks()
    }
    
    func deleteTask(_ task: UserTask) {
        dataManager.deleteTask(task: task)
        loadTasks()
    }
    
    func updateTask(_ task: UserTask, newTitle: String) {
        dataManager.updateTask(task: task, newText: newTitle)
        loadTasks()
    }
    
    func markTaskAsCompleted(_ task: UserTask) {
        dataManager.markTaskAsCompleted(task: task)
        loadTasks()
    }
    
    func toggleTaskList() {
        isShowingPendingTasks.toggle()
        loadTasks()
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.set(true, forKey: "isLoggedOut")
            navigateToLoginCallback?()
        } catch {
            print("Logout error: \(error)")
        }
    }
}
