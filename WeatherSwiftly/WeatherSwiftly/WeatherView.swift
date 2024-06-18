//
//  ContentView.swift
//  WeatherSwiftly
//
//  Created by Mykhailo Vorontsov on 18/06/2024.
//

import SwiftUI


struct WeatherView: View {
    let state: WeatherViewState
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("Next hour")
                    .font(.title2)
            }
            HStack {
                Image(systemName: state.wetherStateIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text(state.temperature)
                    //                                .font(.largeTitle)
                    Text(state.humidity)
                    Text(state.windSpeed)
                }
            }
            Spacer()
            Text(state.weatherDescription)
                .font(.title)
            Spacer()
            Spacer()
            
        } // leading
        .padding()
        
    
    }
}


extension WeatherViewState {
    static func preview() -> Self {
        .init(
            wetherStateIcon: "snow",
            temperature: "32 c",
            humidity: "30%",
            windSpeed: "10kts",
            windAngle: 30,
            weatherDescription: "good",
            background: "clear"
        )
    }
}


#Preview {
    WeatherView(state: .preview())
}
