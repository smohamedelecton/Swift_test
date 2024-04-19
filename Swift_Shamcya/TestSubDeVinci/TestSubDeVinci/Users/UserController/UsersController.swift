//
//  UsersController.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation
import CoreData

class UsersController: ObservableObject {
    static var shared = UsersController()
    
    let container = NSPersistentContainer(name: "UsersStorage")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveUsers(firstName: String, familyName: String, password: String, pseudo: String, isAdmin: Bool) {
        let registeredUser = User(context: viewContext)
        registeredUser.firstName = firstName
        registeredUser.familyName = familyName
        registeredUser.password = password
        registeredUser.pseudo = pseudo
        registeredUser.isAdmin = isAdmin
        registeredUser.id = UUID()
        
        do {
            try viewContext.save()
        } catch {
            print("Data saving failed: \(error)")
        }
    }
    
    func removeUsers (user: User) {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            print("Data saving failed: \(error)")
        }
    }
    
    func getAllUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        do {
         return try viewContext.fetch(request)
        }
        catch {
            return []
        }
    }
}
