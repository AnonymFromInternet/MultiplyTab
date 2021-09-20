//
//  Users Score.swift
//  MultiplyTab
//
//  Created by AnonymFromInternet on 19.09.21.
//

import SwiftUI


struct UsersScore: View {
    
    
    var numberOfQuestions: Int
    var howManyWasRight: Int
    
    var body: some View {
       VStack {
            Spacer()
            Section(header: Text("Your Result").fontWeight(.black).foregroundColor(.yellow).padding()) {
                
                Section {
                    Style(text: "Number of Questions was \(numberOfQuestions)")
                        .padding()
                    Style(text: "You have answered \(howManyWasRight) Questions right")
                    
                }
                Spacer()
           }
            
        }
    }
}


