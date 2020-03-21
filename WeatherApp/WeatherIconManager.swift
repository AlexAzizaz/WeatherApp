//
//  WeatherIconManager.swift
//  WeatherApp
//
//  Created by onyx on 21.03.2020.
//  Copyright © 2020 Alex Al. All rights reserved.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "party-cloudly-night"
    case UnpredictedIcon = "unpredicted-icon"
    
    init(rawValue: String) {
        switch rawValue {
        case "clear-day": self = .ClearDay
        case "clear-night": self = .ClearNight
        case "rain": self = .Rain
        case "snow": self = .Snow
        case "sleet": self = .Sleet
        case "wind": self = .Wind
        case "fog": self = .Fog
        case "clody": self = .Cloudy
        case "partly-cloudy-day": self = .PartlyCloudyDay
        case "patly-cloudy-night": self = .PartlyCloudyNight
        default: self = .UnpredictedIcon
        }
    }
    
}

extension WeatherIconManager {
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
