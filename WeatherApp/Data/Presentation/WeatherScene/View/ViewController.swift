//
//  ViewController.swift
//  WeatherApp
//
//  Created by Sarah on 10/01/2025.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var visibilityTitle: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var humidityTitle: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var feelsLikeTitle: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var pressureTitle: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    private var viewModel: WeatherViewModelProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: WeatherViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "WeatherView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        let repository = NetworkService()
        let useCase = FetchWeatherUseCase(repository: repository)
        self.viewModel = WeatherViewModel(fetchWeatherUseCase: useCase)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchWeather()
    }
    
    
    private func setupUI() {
        background.image = UIImage(named: BackgroundManager.backgroundImage())
        [locationLabel, temperatureLabel, conditionLabel, visibilityTitle, visibilityLabel, humidityTitle, humidityLabel, feelsLikeTitle, feelsLikeLabel, pressureTitle, pressureLabel].forEach {
            $0?.textColor = BackgroundManager.fontColor()
        }
    }
    
    private func bindViewModel() {
        viewModel.weatherPublisher
            .receive(on: DispatchQueue.main)
               .sink(receiveCompletion: { [weak self] completion in
                   if case let .failure(error) = completion {
                       print("Error: \(error.localizedDescription)")
                   }
               }, receiveValue: { [weak self] weather in
                   self?.updateUI(with: weather)
               })
               .store(in: &cancellables)
       }
    
    
    private func updateUI(with weather: WeatherEntity) {
        locationLabel.text = weather.location
        temperatureLabel.text = "\(weather.temperature)°"
        conditionLabel.text = weather.conditionText
        if let url = URL(string: "https:\(weather.conditionIcon)") {
            icon.loadImage(from: url)
        }
        visibilityLabel.text = "\(weather.visibility) km"
        humidityLabel.text = "\(weather.humidity)%"
        feelsLikeLabel.text = "\(weather.feelsLike)°"
        pressureLabel.text = "\(weather.pressure)"
      }
    
}
