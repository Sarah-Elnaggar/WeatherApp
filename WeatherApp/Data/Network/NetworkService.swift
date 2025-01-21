//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 16/01/2025.
//

import Foundation
import Combine

class NetworkService: WeatherRepositoryProtocol {
    func fetchWeather() -> AnyPublisher<WeatherResponse, any Error> {
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=f16082b9be1c4408954131519242208&q=cairo")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
