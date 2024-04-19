//
//  UsersViewModel.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    @Published var password: String = ""
    @Published var pseudo: String = ""
    @Published var isAdmin: Bool = false
    var storageModel = UsersController.shared
    
    var isAlert: Bool = false
    var errorMessage: String = ""
    
    func saveUsers(firstName: String, familyName: String, password: String, pseudo: String, isAdmin: Bool) {
        storageModel.saveUsers(firstName: firstName, familyName: familyName, password: password, pseudo: pseudo, isAdmin: isAdmin)
    }
    
    func deleteUsers (user: User) {
        storageModel.removeUsers(user: user)
    }
    
    func getAllUsers() -> [User] {
        storageModel.getAllUsers()
    }
    
    func refreshData(){
        firstName = ""
    }
        
}
