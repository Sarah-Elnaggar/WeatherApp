//
//  WeatherMapper.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 20/01/2025.
//

import Foundation

extension WeatherResponse {
    func map() -> WeatherEntity {
        return WeatherEntity (
            location: location?.name ?? "",
            temperature: current?.temperature ?? 0.0,
            conditionText: current?.condition?.text ?? "",
            conditionIcon: current?.condition?.icon ?? "",
            visibility: current?.visibility ?? 0.0,
            humidity: current?.humidity ?? 0,
            feelsLike: current?.feelsLike ?? 0.0,
            pressure: current?.pressure ?? 0
        )
    }
}
