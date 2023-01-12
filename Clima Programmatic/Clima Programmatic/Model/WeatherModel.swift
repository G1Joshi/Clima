//
//  WeatherModel.swift
//  Clima Storyboard
//
//  Created by Jeevan Chandra Joshi on 12/01/23.
//

struct WeatherModel {
    let name: String
    let temp: Float
    let conditionId: Int

    var conditionName: String {
        switch conditionId {
        case 200 ... 232:
            return "cloud.bolt.fill"
        case 300 ... 321:
            return "cloud.drizzle.fill"
        case 500 ... 531:
            return "cloud.rain.fill"
        case 600 ... 622:
            return "cloud.snow.fill"
        case 701 ... 781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801 ... 804:
            return "cloud.bolt.fill"
        default:
            return "cloud.fill"
        }
    }
}
