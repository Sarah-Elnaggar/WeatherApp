//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Sarah on 10/01/2025.
//

import Foundation
import Combine


class WeatherViewModel: WeatherViewModelProtocol {
    
    private var weatherResponse: PassthroughSubject<WeatherEntity, Error> = PassthroughSubject()
    var weatherPublisher: AnyPublisher<WeatherEntity, Error> {
        weatherResponse.eraseToAnyPublisher()
    }
    private var cancellable = Set<AnyCancellable>()
    private let fetchWeatherUseCase: FetchWeatherUseCase
        
   
    init(fetchWeatherUseCase: FetchWeatherUseCase) {
        self.fetchWeatherUseCase = fetchWeatherUseCase
    }
    
    
    func fetchWeather() {
        fetchWeatherUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .failure(let error):
                    print("Failed to fetch weather: \(error.localizedDescription)")
                    self.weatherResponse.send(completion: .failure(error))
                case .finished:
                    break
                }
            } receiveValue: { [weak self] weatherResponse in
                guard let self = self else { return }
                self.weatherResponse.send(weatherResponse)
            }
            .store(in: &cancellable)
    }
    
}

