//
//  WeatherViewModelProtocol.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 21/01/2025.
//

import Foundation
import Combine


protocol WeatherViewModelProtocol {
    func fetchWeather()
    var weatherPublisher: AnyPublisher<WeatherEntity, Error> { get }
}
