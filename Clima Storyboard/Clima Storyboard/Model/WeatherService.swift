//
//  WeatherService.swift
//  Clima Storyboard
//
//  Created by Jeevan Chandra Joshi on 12/01/23.
//

import Foundation

protocol WeatherServiceDelegate {
    func didWeatherUpdate(_ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherService {
    var delegate: WeatherServiceDelegate?

    func fetchWeather(_ city: String) {
        let apiKey = ""
        let endpoint = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
        performRequest(endpoint)
    }

    func performRequest(_ endpoint: String) {
        if let url = URL(string: endpoint) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error != nil {
                    delegate?.didFailWithError(error!)
                    return
                }
                if let weatherData = data {
                    if let weather = parseData(weatherData) {
                        delegate?.didWeatherUpdate(weather)
                    }
                }
            }
            task.resume()
        }
    }

    func parseData(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel(name: data.name, temp: data.main.temp, conditionId: data.weather.first?.id ?? 0)
            return weather
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
