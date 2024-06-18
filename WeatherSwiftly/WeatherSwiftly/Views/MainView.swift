//
//  MainView.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import SwiftUI
import Combine


struct MainView: View {
    @ObservedObject var state: MainViewState = .init()
    
    var body: some View {
        VStack {
            TextField("Location please?", text: $state.search)
            Divider()
            switch state.content {
            case .waiting:
                Spacer()
                Text("Waiting for input")
                Spacer()
                EmptyView()
            case .loading:
                Spacer()
                Text("Loading...")
                Spacer()
            case .error(let message):
                Spacer()
                Text("Error")
                    .font(.title)
                Text(message)
                Spacer()
                
            case .complete(let weatherViewState):
                WeatherView(state: weatherViewState)
            }
        }
        .foregroundStyle(Color.accentColor)
        .padding(15)
        .background {
            Image(state.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MainView(state: MainViewState(content: .complete(.preview())))
}
