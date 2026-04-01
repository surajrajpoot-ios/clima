//
//  WeatherData.swift
//  Clima
//
//  Created by surajkumar on 30/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation

public struct WeatherData: Codable {
    var name: String
     var main : Main
    var wind : Wind
    var weather : [Weather]
}
struct Main: Codable {
    var temp: Double
}
struct Wind: Codable {
    var speed: Double
}
struct Weather: Codable {
    var id: Int
}

