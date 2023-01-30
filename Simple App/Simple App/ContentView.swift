//
//  ContentView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var presentedView: PresentedView
    
    @StateObject var globalUname: GlobalUsername
    
    var body: some View {
        Text("Content")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
