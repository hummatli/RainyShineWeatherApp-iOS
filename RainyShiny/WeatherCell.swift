//
//  WeatherCell.swift
//  RainyShiny
//
//  Created by Settar Hummetli on 7/18/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblWeatherType: UILabel!
    @IBOutlet weak var lblHighTemp: UILabel!
    @IBOutlet weak var lblLowTemp: UILabel!
    

    func configureCell(forecast: Forecast) {
        lblLowTemp.text = forecast.lowTemp
        lblHighTemp.text = forecast.highTemp
        lblWeatherType.text = forecast.weatherType
        lblDay.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
        
    }
 
}
