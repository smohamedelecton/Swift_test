//
//  qcmView.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import SwiftUI

struct qcmView: View {
    @State private var questionIndex = 0
    @State private var showScore = false
    @State private var score = 0
    @State private var selectedAnswerIndex: Int?
    var answers:[String] = []
    var question: String = ""
    var isLogged: Bool = true
    var isAdmin = false

let viewModel = QcmModel()

    var body: some View {
        NavigationView {
            if isLogged {
                if isAdmin == false {
                    VStack {
                        ZStack {
                            Text("Good Luck ! 🙃")
                        }
                        if questionIndex < viewModel.questions.count {
                            let question = viewModel.questions[questionIndex]
                            
                            Text(question.statement)
                                .bold()
                                .font(.title)
                                .padding()
                            
                            Picker("Chose your answer", selection: $selectedAnswerIndex) {
                                ForEach(0..<question.proposal.count, id: \.self) { index in
                                    Text(question.proposal[index])
                                        .padding(10)
                                    
                                }
                            }
                            .pickerStyle(.menu)
                            .padding(15)
                            
                            Button("ANSWER") {
                                if let selectedAnswerIndex = selectedAnswerIndex {
                                    if selectedAnswerIndex == question.answer.rawValue - 1 {
                                        score += 1
                                    }
                                    if questionIndex < viewModel.questions.count - 1 {
                                        questionIndex += 1
                                        self.selectedAnswerIndex = nil
                                    } else {
                                        showScore = true
                                    }
                                }
                            }
                            .padding(15)
                            .background(Color .green)
                            .foregroundStyle(Color .black)
                            .disabled(selectedAnswerIndex == nil)
                            
                            NavigationLink("Logout"){
                                MainView()
                            }
                        } else {
                            Text("Quiz Completed")
                            Text("Score: \(score) out of \(viewModel.questions.count)")
                                .font(.headline)
                        }
                    }
                    .navigationBarTitle("TEST", displayMode: .inline)
                    .alert(isPresented: $showScore) {
                        Alert(
                            title: Text("Quiz Complete"),
                            message: Text("Your score is \(score) out of \(viewModel.questions.count)."),
                            dismissButton: .default(Text("OK")) {
                                questionIndex = 0
                                score = 0
                                showScore = false
                            }
                        )
                    }
                    
                }
            } else {
                VStack {
                    Text("There was an error, we can't connect you to the app")
                }
            }
        }
    }
    
    func getQuestion() {
        
    }
    
}

struct AdminView {
    var body: some View {
        VStack {
            Text("Note des élèves")
        }
    }
}




#Preview {
    qcmView()
}
