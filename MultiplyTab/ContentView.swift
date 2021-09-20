//
//  ContentView.swift
//  MultiplyTab
//
//  Created by AnonymFromInternet on 19.09.21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isRandomViewActive = false
    
    @State private var random = Int.random(in: 1..<12)
    
    
    @State private var yourWant = false // is your number is tapped
    
    // MARK:- Alert
    @State private var alertIsShown = false
    @State private var alertTitle = "False Value"
    @State private var alertMessage = "Please give a number between 1 and 12"
    
    
    
    
    
    
    
    @State private var areSettingsShown = true
    
    // MARK:- An initializer for colors in NavigationView
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.yellow]
        
        
        UITableView.appearance().backgroundColor = .clear
        
    }
    
    
    @State private var whichNumber = ""  // TextField for number
    
    
    var intFromWhichNumber: Int {
        let number = Int(whichNumber) ?? 0
        return number
    }
    
    
    @State private var howManyQuestions = 0 // Property for picker
    
    var body: some View {
        
        
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.9137254902, green: 0.231372549, blue: 0.5058823529, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.5725490196, blue: 0.5725490196, alpha: 1))]), startPoint: .leading, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                if isRandomViewActive {
                    
                    Random_Game(number: String(random), numberOfQuestions: howManyQuestions)
                }
                
                if !areSettingsShown && yourWant {
                    
                    
                    Game(number: whichNumber , numberOfQuestions: howManyQuestions)
                    
                }
                
                
                if areSettingsShown {
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 36)
                        
                        Form {
                            
                            Section(header: Style(text: "With wich number do you want to answer ?\n\nTell me a number between:").padding())
                            {
                                
                                TextField("1 and 12", text: $whichNumber)
                                    
                                    .keyboardType(.default)
                                
                                
                                
                                
                            }
                            
                            Section(header: Style(text: "How many questions do you want to answer ?").padding()) {
                                
                                Picker(selection: $howManyQuestions, label: Text(""), content: {
                                    
                                    ForEach(1..<51) { number in
                                        Text("\(number)")
                                        
                                    }
                                })
                                .pickerStyle(WheelPickerStyle())
                                
                                
                            }
                        }
                        
                        Section(header: Style(text: "Game‘s Type:")) {
                            
                            HStack {
                                
                                Button(action: {
                                    withAnimation {
                                        
                                        self.isNumber()
                                        
                                        
                                    }
                                    
                                }, label: {
                                    Style(text: "Your Number")
                                    
                                    
                                    
                                })
                                .frame(width: 135, height: 65, alignment: .center)
                                .background(Color.init(#colorLiteral(red: 0.2196078431, green: 0.007843137255, blue: 0.8549019608, alpha: 1)))
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.init(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), lineWidth: 1))
                                .shadow(color: .blue, radius: 10, x: 1, y: 3)
                                
                                .padding()
                                
                                
                                Button(action: {
                                    withAnimation {
                                        self.areSettingsShown = false
                                        self.random = Int.random(in: 1..<12)
                                        self.isRandomViewActive = true
                                    }
                                    
                                    
                                }, label: {
                                    Style(text: "Random Numbers")
                                    
                                    
                                    
                                    
                                })
                                .frame(width: 135, height: 65, alignment: .center)
                                .background(Color.init(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.init(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), lineWidth: 1))
                                .shadow(color: .blue, radius: 10, x: 1, y: 3)
                                
                                .padding()
                                
                                
                                
                                
                                
                            }
                        }
                        
                        Spacer()
                        
                    }
                }
            }
            .navigationBarTitle(Text("Multiplication Table"))
            
            .toolbar(content: {
                
                ToolbarItem {
                    
                    Button(action: {
                        
                        withAnimation {
                            self.areSettingsShown = true
                            self.isRandomViewActive = false
                            whichNumber = ""
                        }
                        
                        
                        
                    }, label: {
                        Text(!areSettingsShown ? "New Game" : "")
                        
                        
                        
                    })
                }
            })
            
            .alert(isPresented: $alertIsShown, content: {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")) {
                        alertIsShown = false
                    })})
            
        }
        .accentColor(.yellow)
        
        
        
    }
    
    func isNumber() {
        
        if intFromWhichNumber == 0 {
            alertIsShown = true
        } else {
            yourWant = true
            self.areSettingsShown.toggle()
        }
    }
    
    
}

struct Style: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color.init(#colorLiteral(red: 1, green: 0.862745098, blue: 0.862745098, alpha: 1)))
            .fontWeight(.bold)
            .shadow(color: .blue, radius: 3, x: 1, y: 3.0)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
