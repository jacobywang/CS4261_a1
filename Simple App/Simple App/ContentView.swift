//
//  ContentView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var presentedView: PresentedView
    
    @EnvironmentObject var globalUname: GlobalUsername
    
    var body: some View {
        Text(globalUname.username + "'s Content would be shown here!")
        Text("(If I hadn't spent sooo long on setting up Firebase and dealing with async swift closures haha!)").padding([.top, .horizontal], 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
