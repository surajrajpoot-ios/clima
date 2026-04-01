//
//  WeatherModel.swift
//  Clima
//
//  Created by surajkumar on 30/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation
struct WeatherModel{
    let temp: Double
    let name: String
    let id: Int
    init(temp: Double, name: String, id: Int) {
        self.temp = temp
        self.name = name
        self.id = id
    }
    var temperature: String{
        return String(format:"%.0f",temp)
    }
    func getWeatherImageName(id: Int) -> String{
        switch id {
            case 200...232:
            return "thunderstorm"
        case 300...321:
            return "drizzle"
        case 500...531:
            return "rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "atmosphere"
        default :
            return "clear"
        }
    }
}
