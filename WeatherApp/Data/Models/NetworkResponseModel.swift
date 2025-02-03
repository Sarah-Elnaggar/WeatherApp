//
//  NetworkResponse.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 15/01/2025.
//

import Foundation

struct WeatherResponse: Decodable {
    let location: Location?
    let current: Current?
}

struct Location: Decodable {
    let name: String?
}

struct Current: Decodable {
    let temperature: Double?
    let condition: WeatherCondition?
    let feelsLike: Double?
    let humidity: Int?
    let pressure: Int?
    let visibility: Double?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_c"
        case feelsLike = "feelslike_c"
        case visibility = "vis_km"
        case pressure = "pressure_mb"
        case condition
        case humidity
    }
}

struct WeatherCondition: Decodable {
    let text: String?
    let icon: String?
}
