//
//  SignUpView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var presentedView: PresentedView
    
    @StateObject var globalUname: GlobalUsername
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("CEATE YOUR PROFILE")
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
            
            HStack {
                Button("Back", action: back)
                    .padding([.trailing], 10)
                Button("Create Profile", action: cprofile)
                    .buttonStyle(.bordered)
            }
            
        }
        .padding(20)
        
    }
    
    private func back() {
        presentedView.currentView = .login
    }
    
    private func cprofile() {
        if username.count == 0 || password.count == 0 {
            print("Username and password must not be empty [" + username + ", " + password + "]")
            return
        }
        
        //Check if username exists
            //if no then continue navigate
            //if yes then change label to alert user
        
        globalUname.username = username
        presentedView.currentView = .content
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
