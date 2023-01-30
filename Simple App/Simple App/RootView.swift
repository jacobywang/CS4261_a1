//
//  RootView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var presentedView: PresentedView
    
    var body: some View {
        switch presentedView.currentView {
            case .login: LoginView()
            case .sup: SignUpView()
            case .content: ContentView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}


class PresentedView: ObservableObject {
    enum AvailableViews {
        case login, sup, content
    }
    @Published var currentView: AvailableViews = .login
}


class GlobalUsername: ObservableObject {
    @Published var username = ""
}
