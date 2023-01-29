//
//  ContentView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI



struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var isSignedUp = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("LOGIN")
                .padding(10)
            VStack {
                LabeledContent("Username") {
                    TextField(text: $username, prompt: Text("Required")) {
                        Text("Username")
                    }
                }
                LabeledContent("Password") {
                    SecureField(text: $password, prompt: Text("Required")) {
                        Text("Password ")
                    }
                }
                
            }
            .textFieldStyle(.roundedBorder)
            .padding(10)
            Button("Sign In", action: signIn)
                .buttonStyle(.bordered)
                .padding([.bottom], 6)
            LabeledContent("Create new account") {
                Button("Sign Up") {
                    isSignedUp = true
                }
            }.padding([.horizontal], 40)
            
        }
        .padding(20)
    }
    
    private func signIn() {
        // check FIREBASE
        
        // if good -> navigate to main page
            // say welcome and show some api stuff
        // if not change LOGIN textbox to be red and bad!
        return
    }
    
    private func signUp() {
        // navigate to new sign up page
            // has go back button
        // on submit navigate to main page
        return
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
