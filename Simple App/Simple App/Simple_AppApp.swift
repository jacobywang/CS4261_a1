//
//  Simple_AppApp.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI

@main
struct Simple_AppApp: App {
    var body: some Scene {
        WindowGroup {
            //LoginView()
            RootView()
                .environmentObject(PresentedView())
        }
    }
}
