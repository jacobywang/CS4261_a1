//
//  Simple_AppApp.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Simple_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            //LoginView()
            RootView()
                .environmentObject(PresentedView())
                .environmentObject(GlobalUsername())
        }
    }
}
