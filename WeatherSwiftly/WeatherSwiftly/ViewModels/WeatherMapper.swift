//
//  WeatherMapper.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import Foundation

protocol WeatherMapping {
    func map(dto: WeatherConditionsDTO) -> WeatherViewState
}

final class WeatherMapper: WeatherMapping {
    private lazy var measurementFormatter: MeasurementFormatter = {
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitOptions = .providedUnit
        measurementFormatter.numberFormatter.maximumFractionDigits = 0
        measurementFormatter.numberFormatter.roundingMode = .floor
        return measurementFormatter
    }()

    
    private func temperature(from double: Double) -> String {
        measurementFormatter.string(
            from: Measurement(value: double, unit: UnitTemperature.celsius)
        )
    }

    private func windSpeed(from number: Double) -> String {
        measurementFormatter.string(
            from: Measurement(
                value: number,
                unit: UnitSpeed.metersPerSecond
            )
        )
    }

    
    private func iconName(from string: String?) -> String {
        switch string {
        case "Rain": return "cloud.rain"
        case "Clear": return "sun.max"
        case "Snow": return "cloud.snow"
        case "Clouds": return "cloud"
        case "Fog": return "cloud.fog"
        default:
            print("unknown for icon: \(string ?? "<null>")")
            return "questionmark.app"
        }
    }

    private func bgName(from string: String?) -> String {
        switch string {
        case "Rain": return "rain"
        case "Clear": return "clear"
        case "Snow": return "snow"
        case "Clouds": return "clouds"
        case "Fog": return "fog"
        default:
            print("unknown for bg: \(string ?? "<null>")")
            return ""
        }
    }
    
    func map(dto: WeatherConditionsDTO) -> WeatherViewState {
        .init(
            wetherStateIcon: iconName(from: dto.weather.first?.main),
            temperature: temperature(from: dto.main.temp),
            humidity: "\(dto.main.humidity) %",
            windSpeed: windSpeed(from: dto.wind.speed),
            windAngle: dto.wind.deg,
            weatherDescription: dto.weather.first?.description ?? "",
            background: bgName(from: dto.weather.first?.main)
        )
    }
}


