//
//  UIImageViewExtension.swift
//  WeatherApp
//
//  Created by Sarah ElNaggar on 20/01/2025.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response ,error in
            if let error = error {
                print("Failed to load image: \(error.localizedDescription)")
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("Failed to decode image data")
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
