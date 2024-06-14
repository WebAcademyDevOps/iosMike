//
//  ContentView.swift
//  FirstApp
//
//  Created by Mykhailo Vorontsov on 12/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button") {
                
            }
            ColorPicker(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*/.constant(.red)/*@END_MENU_TOKEN@*/)
            .padding([.top, .leading, .bottom], 7.0)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Привіт!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
