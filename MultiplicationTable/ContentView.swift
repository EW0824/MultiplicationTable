//
//  ContentView.swift
//  MultiplicationTable
//
//  Created by OAA on 18/09/2022.
//

import SwiftUI

//struct Questions {
//
//
//
//}






struct ContentView: View {
    
    var questionNums = [5, 10, 20]
    @State private var questionNum = 5
    @State private var tableNum = 2
    @State private var restartGame = false
    
    @FocusState private var answerIsFocused: Bool;
    
    @State private var answer = "";
    @State private var answers = [String](repeating: "", count: 10);
    
    
    var questions: [String] {
        generateQuestions()
    }
    
    
    
    var body: some View {
        
        
        VStack {
            Text ("Multiplication Table")
                .font(.title)
                .fontWeight(.bold)
            
            
            HStack{
                Image("bear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("chick")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("rabbit")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            
            NavigationView {
                
                    
                    List {
                        
                        Section {
                            Stepper("Table of \(tableNum)", value: $tableNum, in:2...12, step: 1)
    //                        Picker("Multiplication table to practice:", selection: $tableNum) {
    //                            ForEach(2..<13) {
    //                                Text("\($0)")
    //                            }
    //                        }
                        } header: {
                            Text("multiplication table to practice")
                                .font(.headline)
                        }
                        
                        Section {
                            Picker ("How many questions would you like?", selection: $questionNum) {
                                ForEach(questionNums, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                            
                        } header: {
                            Text("How many questions to answer")
                                .font(.headline)
                        }
                    
                        
                        Section {
                            
    //                        ForEach($answers) {
    //                            TextField("", text: $0.value)
    //
    //                        }
                            
                            ForEach(questions.indices, id: \.self) {
                                Text("What is \(questions[$0])")
                                TextField("Answer: ", text: $answers[$0])
                                    .keyboardType(.decimalPad)
                                    .focused($answerIsFocused)

                            }

                                                    
    //                        ForEach(0..<3, id: \.self) { i in
    //                            Text("What is \(questions[i])")
    //                            TextField("Answer: ", text: $answers[$0])
    //                                .keyboardType(.decimalPad)
    //                                .focused($answerIsFocused)
    //
    //                        }
                        }
                        

                        
                    }
                    .toolbar{
                        ToolbarItemGroup(placement: .keyboard){
                            Spacer()
                            Button("Done") {
    //                            amountIsFocused = false
                            }
                        }
                    }
//                .toolbar {
//                    Button("New Game") {restartGame.toggle()}
//                }
//                .onSubmit(checkAnswer)
                
            }
            
        }
    }
    
    
    
    
    func generateQuestions() -> [String] {

        let num = (tableNum > 10) ? tableNum : 10
        let arr = Array(1...num)
        var questions = [String]()

        for _ in 0..<questionNum {

            let randomNum = arr.randomElement()!;
//            arr = arr.filter{ $0 != randomNum };
//
//            let index = Int.random(in: 0..<11)
//            let randInt = array.remove(at: indexz)
            questions.append("\(tableNum) x \(randomNum)")
        }

        return questions

    }
    
    
    func checkAnswer() {
        
    }
    
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
