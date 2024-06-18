//
//  Untitled.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//
import Combine
import Foundation

protocol WeatherViewModeling {
    func start() -> AnyCancellable
}

final class WeatherViewModel: WeatherViewModeling {
    internal init(
        state: MainViewState,
        service: any WeatherServing,
        mapper: any WeatherMapping
    ) {
        self.state = state
        self.service = service
        self.mapper = mapper
    }
    
    let state: MainViewState
    let service: WeatherServing
    let mapper: WeatherMapping
    
    func start() -> AnyCancellable {
        state.$search
            .debounce(for: .seconds(3), scheduler: DispatchQueue.main)
            .filter { $0.count > 3 }
            .flatMap { [service, mapper] in
                service
                    .search(for: $0)
                    .map {
                        mapper.map(dto: $0)
                    }
                    .map {
                        ContentState.complete($0)
                    }
                    .replaceError(with: .error("some error"))
                    .delay(for: .seconds(3), scheduler: DispatchQueue.main)
                    .prepend(.loading)
            }
            .prepend(.waiting)
            .receive(on: DispatchQueue.main)
            .assign(to: \.content, on: state)
    }
    
}
