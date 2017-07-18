//
//  Constants.swift
//  RainyShiny
//
//  Created by Settar Hummetli on 7/17/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import Foundation

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=71c8663c6a508affe0440e912dd294d7"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=71c8663c6a508affe0440e912dd294d7"

typealias DownloadComplete = () -> ()



