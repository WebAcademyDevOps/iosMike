//
//  WeatherConditionsDTO.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import Foundation

struct WeatherConditionsDTO: Codable {
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    
    struct Main: Codable {
        let temp: Double
        let humidity: Int
    }
    
    struct Weather: Codable {
        let main: String
        let description: String
    }
    
    let name: String
    let wind: Wind
    let main: Main
    let weather: [Weather]
    
    //    let coord: Coordinates
}
