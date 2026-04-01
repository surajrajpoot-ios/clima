//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController , UITextFieldDelegate, WeatherDataProtocol{
    var weatherManager = WeatherManager()
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
       self.searchTextField.delegate = self
    }

    
    @IBAction func searchButtonGotPreseed(_ sender:UIButton) {
        if let text = searchTextField.text {
            print(text)
        }else {
            fatalError("")
        }
        if searchTextField.text == "" {
            searchTextField.placeholder = "Please enter a city name"
        }
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        cityLabel.text = searchTextField.text!
        searchTextField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       if searchTextField.text == "" {
           searchTextField.placeholder = "Please enter a city name"
           return false
        }
        else{
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = searchTextField.text {
            weatherManager.fetchWeather(cityName: text)
        }
        searchTextField.text = ""
    }
    func didUpdateWeather (weather: WeatherModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.temperatureLabel.text =  "\(weather.temperature)"
            self.cityLabel.text = weather.name
            self.conditionImageView.image = UIImage(named: "\(weather.getWeatherImageName( id:weather.id))")
            // Optionally update condition image if available in WeatherModel
            // self.conditionImageView.image = UIImage(systemName: weather.conditionName)
          
        }
    }
}

