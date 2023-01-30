//
//  ContentView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI
import FirebaseDatabase


struct LoginView: View {
    
    @EnvironmentObject var presentedView: PresentedView
    @EnvironmentObject var globalUname: GlobalUsername
    
    @State private var username = ""
    @State private var password = ""
    
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
                Button("Sign Up", action: signUp)
            }.padding([.horizontal], 45)
            
        }
        .padding(20)
        
    }
    
    private func signIn() {
        if username.count == 0 || password.count == 0 {
            print("Username and password must not be empty [" + username + ", " + password + "]")
            return
        }
        
        // check FIREBASE
        let ref = Database.database().reference()
        ref.child(username).getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            let actual_pass = snapshot?.value as? String ?? "USER-DOES-NOT-EXIST";
            
            if password == actual_pass {
                globalUname.username = username
                presentedView.currentView = .content
            } else {
                print("Invalid Credentials")
            }
        });
    }
    
    private func signUp() {
        presentedView.currentView = .sup
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



//
//
////
////  ContentView.swift
////  Simple App
////
////  Created by Jacob Wang on 1/29/23.
////
//
//import SwiftUI
//
//
//
//struct LoginView: View {
//
//    @EnvironmentObject var presentedView: PresentedView
//
//    @State private var username = ""
//    @State private var password = ""
//    @State private var validSignIn = false
//
//    var body: some View {
//
//        NavigationView {
//
////            NavigationLink(destination: SignUpView()) {
////                if (!validSignIn) {
////                    EmptyView()
////                } else {
////                    SignUpView()
////                }
////
////            }
//
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("LOGIN")
//                    .padding(10)
//                VStack {
//                    LabeledContent("Username") {
//                        TextField(text: $username, prompt: Text("Required")) {
//                            Text("Username")
//                        }
//                    }
//                    LabeledContent("Password") {
//                        SecureField(text: $password, prompt: Text("Required")) {
//                            Text("Password ")
//                        }
//                    }
//
//                }
//                .textFieldStyle(.roundedBorder)
//                .padding(10)
//                Button("Sign In", action: signIn)
//                    .buttonStyle(.bordered)
//                    .padding([.bottom], 6)
//
//
//                LabeledContent("Create new account") {
//                    NavigationLink(destination: SignUpView()){
//                        Text("Sign Up")
//                    }
//                }.padding([.horizontal], 45)
//
//            }
//            .padding(20)
//
////            NavigationLink(destination: isValidSignIn()){}
//        }
//    }
//
//    private func signIn() {
//        // check FIREBASE
//
//        // if good -> navigate to main page
//            // say welcome and show some api stuff
//        // if not change LOGIN textbox to be red and bad!
//
//        validSignIn = true
//
//    }
//
//    @ViewBuilder
//    private func isValidSignIn() -> some View {
//        if validSignIn {
//            SignUpView()
//        } else {
//            EmptyView()
//        }
//    }
//
//}
//
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
