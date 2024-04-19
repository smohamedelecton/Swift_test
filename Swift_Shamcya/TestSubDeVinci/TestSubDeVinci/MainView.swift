//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = UsersViewModel()
     @State var isLogged: Bool = false
    @State var isAdmin: Bool = false
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome! 👋")
                .font(.title)
        }
        .padding()
        
        VStack {
            Form {
                Text("Sign IN ! ")
                    .multilineTextAlignment(.center)
                    .bold()
                TextField("Pseudo", text: $viewModel.firstName ) {
                    
                }
                TextField("Password", text: $viewModel.password)
                NavigationStack{
                    NavigationLink(destination: qcmView()) {
                        Button("Sign In") {
                            isLogged = true
                        }
                    }
                }
            }
        }
        
        Divider()
        
            VStack {
                Text("Le nom du user est : \(viewModel.firstName)")
                Form {
                    Text("Sign Up ! ")
                        .multilineTextAlignment(.center)
                        .bold()
                    TextField("First Name", text: $viewModel.firstName) {
                        
                    }
                    TextField("Family Name", text: $viewModel.familyName){
                        
                    }
                    TextField("Pseudo", text: $viewModel.pseudo) {
                        
                    }
                    TextField("Password", text: $viewModel.password) {
                        
                    }
                    Toggle("Are you an Admin ?",isOn: $viewModel.isAdmin)
                    
                    
                    Button("Sign Up") {
                        viewModel.saveUsers(firstName: viewModel.firstName, familyName: viewModel.familyName, password: viewModel.password, pseudo: viewModel.pseudo, isAdmin: isAdmin)
                        viewModel.refreshData()
                        isLogged = true
                    }
                    
                }
        }
    }
}

#Preview {
    MainView()
}
