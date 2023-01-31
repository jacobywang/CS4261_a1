//
//  SignUpView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI
import FirebaseDatabase

struct SignUpView: View {
    
    @EnvironmentObject var presentedView: PresentedView
    
    @EnvironmentObject var globalUname: GlobalUsername
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
                    TextField(text: $Username, prompt: Text("Required")) {
                        Text("Username")
                    }
                }
                LabeledContent("Password") {
                    SecureField(text: $Password, prompt: Text("Required")) {
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
            Text("If the page doesn't change, the username is already taken.")
                .padding(10)
            
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
        
        let ref = Database.database().reference()
        ref.child(username).getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            let actual_pass = snapshot?.value as? String ?? "USER-DOES-NOT-EXIST";
            
            if actual_pass == "USER-DOES-NOT-EXIST" {
                Database.database().reference().child(username).setValue(password)
                globalUname.username = username
                presentedView.currentView = .content
            } else {
                print("Username Is Already Taken")
            }
        });
//
//        globalUname.username = username
//        presentedView.currentView = .content
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
