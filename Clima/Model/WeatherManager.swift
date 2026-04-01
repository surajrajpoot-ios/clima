//
//  WeatherManager.swift
//  Clima
//
//  Created by surajkumar on 27/03/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation
protocol WeatherDataProtocol{
    func didUpdateWeather(weather:WeatherModel)
}
struct WeatherManager{
    var delegate:WeatherDataProtocol?
    func fetchWeather(cityName:String){
        let url = "https://api.openweathermap.org/data/2.5/weather?appid=f84e577531e5e1b419e9511b6265bd19&q=\(cityName)"
        performurl(urlString: url)
    }
    func performurl(urlString:String){
        if  let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                }
                if let actualData = data {
                    if let weather = prepareNsDecoder(weatherData: actualData){
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    func prepareNsDecoder(weatherData:Data)-> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherModel = WeatherModel(temp: decodedData.main.temp, name: decodedData.name, id: decodedData.weather[0].id)
            return weatherModel
        }catch{
            print(error)
            return nil
        }
        
    }
    
}
