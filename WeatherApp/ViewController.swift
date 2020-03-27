//
//  ViewController.swift
//  WeatherApp
//
//  Created by onyx on 18.03.2020.
//  Copyright © 2020 Alex Al. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLable: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var appearentTemperatureLable: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let locationManager = CLLocationManager()
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        toggleActivityIndicator(on: true)
        getCurrentWeatherData()
    }
    
    func toggleActivityIndicator(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    lazy var weatherManager = APIWeatherManager(apiKey: "91ad4e09a24133ad33c5abccc19563d0")
    lazy var coordinates = Coordinates(latitude: 55.686627, longitude: 37.307674)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        getCurrentWeatherData()
        
        
        //        let icon = WeatherIconManager.Rain.image
        //        let currentWeather = CurrentWeather(temeratura: 10.0, apparentTemperature: 5.0, humidity: 30, pressure: 750, icon: icon)
        //        updateUIWith(currentWeather: currentWeather)
        
        /*Говно
         ////       let urlString = "https://api.darksky.net/forecast/91ad4e09a24133ad33c5abccc19563d0/37.8267,-122.4233"
         //        let baseURL = URL(string: "https://api.darksky.net/forecast/91ad4e09a24133ad33c5abccc19563d0/")
         //        let fullURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)
         //
         //        let sessionConfiguration = URLSessionConfiguration.default
         //        let session = URLSession(configuration: sessionConfiguration)
         //
         //        let request = URLRequest(url: fullURL!)
         //        let dataTask = session.dataTask(with: fullURL!) { (data, response, error) in
         //
         //        }
         //        dataTask.resume()
         */
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last! as CLLocation
        
        print("my location latitude: \(userLocation.coordinate.latitude), longitude: \(userLocation.coordinate.longitude)")
    }
    
    func getCurrentWeatherData() {
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            
            self.toggleActivityIndicator(on: false)
            
            switch result {
            case .Sucess(let currentWeather):
                self.updateUIWith(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                
                let alertController = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        imageView.image = currentWeather.icon
        //        pressureLable.text = "\(Int(currentWeather.pressure))mm"
        //        temperatureLable.text = "\(Int(currentWeather.temeratura))ºC"
        //        appearentTemperatureLable.text = "\(Int(currentWeather.appearentTemperature))ºC"
        //        humidityLable.text = "\(Int(currentWeather.humidity))%"
        
        pressureLable.text = currentWeather.pressureString
        temperatureLable.text = currentWeather.temperatureString
        appearentTemperatureLable.text = currentWeather.appearentTemperaturestring
        humidityLable.text = currentWeather.humiditysString
        
        
    }
    
}

