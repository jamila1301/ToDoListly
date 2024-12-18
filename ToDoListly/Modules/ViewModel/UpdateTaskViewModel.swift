//
//  UpdateTaskViewModel.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 23.11.24.
//

import Foundation

class UpdateTaskViewModel {
    
    private var task: UserTask?
    
    var taskTitle: String {
        task?.title ?? ""
    }
    
    var onTaskUpdated: ((String) -> Void)?
    
    init(task: UserTask?) {
        self.task = task
    }
    
    func updateTask(with title: String) -> Bool {
        guard !title.isEmpty else { return false }
        task?.title = title
        do {
            try task?.managedObjectContext?.save()
            onTaskUpdated?(title)
            return true
        } catch {
            print("Error updating task: \(error)")
            return false
        }
    }
}

