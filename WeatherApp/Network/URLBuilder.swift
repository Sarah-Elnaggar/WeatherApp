//
//  APIManager.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 25/01/2025.
//


import Foundation

class URLBuilder {
    private var scheme: String = "https"
    private var host: String = "api.weatherapi.com/v1"
    private var path: String = ""
    private var queryParameters: [String: String] = [:]
    
    func setScheme(_ scheme: String) -> URLBuilder {
        self.scheme = scheme
        return self
    }
    
    func setHost(_ host: String) -> URLBuilder {
        self.host = host
        return self
    }
    
    func setPath(_ path: APIEndpoint) -> URLBuilder {
        self.path = path.path
        return self
    }
    
    func setQueryParameter(_ key: String, _ value: String) -> URLBuilder {
        queryParameters[key] = value
        return self
    }
    
    func bulidURL() -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url
    }
    
}
