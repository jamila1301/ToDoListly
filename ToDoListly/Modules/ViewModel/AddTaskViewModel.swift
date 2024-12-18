//
//  AddTaskViewModel.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 22.11.24.
//

import UIKit

class AddTaskViewModel {

    private let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var onTaskAdded: ((UserTask) -> Void)?
    
    func addTask(title: String, userId: String) -> Bool {
        guard let context = context else { return false }
        
        let userTask = UserTask(context: context)
        userTask.title = title
        userTask.isCompleted = false
        userTask.userId = userId
        
        do {
            try context.save()
            onTaskAdded?(userTask)
            return true
        } catch {
            print("Failed to save task: \(error.localizedDescription)")
            return false
        }
    }
    
    func isValidTask(_ title: String) -> Bool {
        return !title.isEmpty
    }
}
