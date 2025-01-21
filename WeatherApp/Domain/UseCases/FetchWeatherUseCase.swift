//
//  FetchWeatherUseCase.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 16/01/2025.
//

import Foundation
import Combine


class FetchWeatherUseCase {
    private let repository: WeatherRepositoryProtocol

    init(repository: WeatherRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<WeatherEntity, Error> {
        repository.fetchWeather().map {
            $0.map()
        }
        .eraseToAnyPublisher()
    }
}
