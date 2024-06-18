//
//  WeatherService.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import Combine
import Foundation

protocol WeatherServing {
    func search(for query: String) -> AnyPublisher<WeatherConditionsDTO, Error>
}

final class WeatherService: WeatherServing {
    
    private var urlSession: URLSession = .shared
    private var decoder: JSONDecoder = .init()
    
    func search(for query: String) -> AnyPublisher<WeatherConditionsDTO, Error> {
        let address = "https://api.openweathermap.org/data/2.5/weather?q=\(query)&appid=2bb9b8298063ad885c41784c28ff55c9&units=metric"
        let url = URL(string: address)!
        return urlSession
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: WeatherConditionsDTO.self, decoder: decoder)
            .eraseToAnyPublisher()
    } // Search
    
}

