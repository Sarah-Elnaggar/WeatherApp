//
//  BackgroundManager.swift
//  WeatherApp
//
//  Created by Sarah on 10/01/2025.
//

import Foundation
import UIKit

class BackgroundManager {
    
    static func backgroundImage() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 5 && hour < 18 {
            return "morning_background"
        } else {
            return "evening_background"
        }
    }
    
    static func fontColor() -> UIColor {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 5 && hour < 18 {
            return .black
        } else {
            return .white
        }
    }
}
