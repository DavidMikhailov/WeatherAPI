//
//  ViewController+ alertController.swift
//  WeatherAPI
//
//  Created by Давид Михайлов on 07.12.2020.
//  Copyright © 2020 Давид Михайлов. All rights reserved.
//

import UIKit

extension ViewController {
    
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandeler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                print("search info for the \(cityName)")
                //self.networkWeatherManager.fetchCurrentWeather(forCity: cityName) самый простой способ
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandeler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
