//
//  MainViewState.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import Combine

enum ContentState {
    case waiting
    case loading
    case error(String)
    case complete(WeatherViewState)
}

class MainViewState: ObservableObject {
    internal init(search: String = "", content: ContentState = .waiting) {
        self.search = search
        self.content = content
    }
    
    @Published var search: String = ""
    @Published var content: ContentState = .waiting
}

extension MainViewState {
    var background: String {
        switch content {
        case .complete(let state):
            return state.background
        default:
            return "unknown"
        }
    }
}
