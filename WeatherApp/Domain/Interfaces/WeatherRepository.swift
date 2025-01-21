//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 15/01/2025.
//

import Foundation
import Combine

protocol WeatherRepositoryProtocol {
    func fetchWeather() -> AnyPublisher<WeatherResponse, Error>
}
