//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 15/01/2025.
//

import Foundation
import Combine

protocol WeatherRepositoryProtocol {
    func fetchWeather(for location: String) -> AnyPublisher<WeatherResponse, NetworkError>
}

class WeatherRepository: WeatherRepositoryProtocol {
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchWeather(for location: String) -> AnyPublisher<WeatherResponse, NetworkError> {
        guard let url = URLBuilderDiercrory.buil(path: .getWeather, for: location)
                else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        print("Fetching weather from: \(url)")
        return networkManager.request(url: url.url, responseType: WeatherResponse.self).eraseToAnyPublisher()
    }
}
