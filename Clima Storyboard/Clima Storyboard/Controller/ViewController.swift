//
//  ViewController.swift
//  Clima Storyboard
//
//  Created by Jeevan Chandra Joshi on 12/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var searchField: UITextField!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!

    var weatherService = WeatherService()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
        weatherService.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchField.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return textField.text != ""
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cityName = textField.text {
            weatherService.fetchWeather(cityName)
        }
        textField.text = ""
    }
}

extension ViewController: WeatherServiceDelegate {
    func didWeatherUpdate(_ weather: WeatherModel) {
        DispatchQueue.main.async {
            self.tempLabel.text = String(format: "%.1f°C", weather.temp)
            self.iconImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.name
        }
    }

    func didFailWithError(_ error: Error) {
        print(error)
    }
}
