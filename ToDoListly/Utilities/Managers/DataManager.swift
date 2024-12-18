//
//  DataManager.swift
//  ToDoListly
//
//  Created by Jamila Mahammadli on 15.11.24.
//

import UIKit
import CoreData

class DataManager {
    static let shared = DataManager()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveTask(title: String, isCompleted: Bool, userId: String) {
        let newTask = UserTask(context: context)
        newTask.title = title
        newTask.isCompleted = isCompleted
        newTask.userId = userId
        
        do {
            try context.save()
        } catch {
            print("Error saving task: \(error)")
        }
    }

    func fetchTasks(for userId: String, isCompleted: Bool) -> [UserTask] {
        let request: NSFetchRequest<UserTask> = UserTask.fetchRequest()
        request.predicate = NSPredicate(format: "userId == %@ AND isCompleted == %@", userId, NSNumber(value: isCompleted))
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching tasks: \(error)")
            return []
        }
    }

    func deleteTask(task: UserTask) {
        context.delete(task)
        do {
            try context.save()
        } catch {
            print("Error deleting task: \(error)")
        }
    }

    func updateTask(task: UserTask, newText: String) {
        task.title = newText
        do {
            try context.save()
        } catch {
            print("Error updating task: \(error)")
        }
    }

    func markTaskAsCompleted(task: UserTask) {
        task.isCompleted = true
        do {
            try context.save()
        } catch {
            print("Error marking task as completed: \(error)")
        }
    }
}

