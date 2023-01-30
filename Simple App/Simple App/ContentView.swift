//
//  ContentView.swift
//  Simple App
//
//  Created by Jacob Wang on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var globalUname: GlobalUsername
    @EnvironmentObject var apiFact : ApiFact
    
    var body: some View {
        VStack {
            Text("Welcome [" + globalUname.username + "]!")
                .padding([.bottom, .horizontal], 40)
                .padding([.top], 130)
            Form {
                Spacer()
                Text(apiFact.text)
                Spacer()
            }
            Button("New Fact") {
                apiFact.getNewFact()
            }
                .buttonStyle(.bordered)
                .padding([.bottom], 200)
                .padding([.top], 20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class ApiFact: ObservableObject {
    @Published var text = "Click the button to get a Chuck Norris fact!"
    
    public func getNewFact() {
        Task {
            let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.chucknorris.io/jokes/random")!)
            let decodedResponse = try? JSONDecoder().decode(Fact.self, from: data)
            self.text = decodedResponse?.value ?? "Click the button to get a Chuck Norris fact!"
        }
    }
}

struct Fact: Codable {
    let value: String
}
