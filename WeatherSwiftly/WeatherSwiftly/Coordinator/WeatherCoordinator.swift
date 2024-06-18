//
//  WeatherCoordinator.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import Foundation
import SwiftUI
import Combine

final class WeatherCoordinator {
    var bag: Set<AnyCancellable> = []
    
    func prepareView() -> some View {
        let state = MainViewState()
        
        let viewModel = WeatherViewModel(
            state: state,
            service: WeatherService(),
            mapper: WeatherMapper()
        )
        
        let mainView = MainView(state: state)
        
        viewModel
            .start()
            .store(in: &bag)
        
        return mainView
    }
}

