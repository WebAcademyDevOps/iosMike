//
//  WeatherSwiftlyApp.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import SwiftUI

@main
struct WeatherSwiftlyApp: App {
    let coordinator = WeatherCoordinator()
    var body: some Scene {
        WindowGroup {
            coordinator.prepareView()
        }
    }
}
