//
//  Game.swift
//  MultiplyTab
//
//  Created by AnonymFromInternet on 19.09.21.
//

import SwiftUI


struct Game: View {
    
    let contentView = ContentView()
    
    
    
    
    @State private var usersScore = 0
    
    
    @State private var howManyQuestions = 0
    
    @State private var usersScoreIsShowing = false
    
    @State private var byWhatMultiplaying = Int.random(in: 1..<12)
    
    
    
    @State var number: String
    
    var numberOfQuestions: Int
    
    
    
    
    
    @State private var userAnswer = ""
    
    var body: some View {
        
        if !usersScoreIsShowing {
            
            VStack {
                
                Spacer()
                    .frame(height: 50)
                
                Section(header: Text("How much is \(number) multiply by \(byWhatMultiplaying) ?").fontWeight(.black).foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.862745098, blue: 0.862745098, alpha: 1))).padding()) {
                    
                    
                    
                    TextField("Your Answer", text: $userAnswer)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .frame(width: 136, height: 50)
                        .background(Color.init(#colorLiteral(red: 1, green: 0.862745098, blue: 0.862745098, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    
                }
                Spacer()
                    .frame(height: 65)
                
                Button(action: {
                    withAnimation {
                        self.nextQuestion()
                        self.howManyQuestions += 1
                        
                    }
                    
                    
                    
                    
                }, label: {
                    Style(text: "Next Question")
                    
                })
                .frame(width: 135, height: 65, alignment: .center)
                .background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.007843137255, blue: 0.8549019608, alpha: 1)))
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.init(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), lineWidth: 1))
                .shadow(color: .blue, radius: 10, x: 1, y: 3)
                
                
                Spacer()
                
                
            }
            
        } else {
            
            UsersScore(numberOfQuestions: numberOfQuestions + 1, howManyWasRight: usersScore)
        }
        
    }
    
    func nextQuestion() {
        
        if let intNumber = Int(number) {
            
            let rightAnswer = intNumber * byWhatMultiplaying
            
            if let intUserAnswer = Int(userAnswer) {
                
                if rightAnswer == intUserAnswer {
                    usersScore += 1
                }
                
            }
            
            
        }
        result()
        userAnswer = ""
        byWhatMultiplaying = Int.random(in: 1..<12)
        
        
    }
    
    func result() {
        
        
        if numberOfQuestions == howManyQuestions {
            
            usersScoreIsShowing = true
        }
        
    }
    
}


