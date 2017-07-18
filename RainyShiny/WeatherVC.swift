//
//  WheatherVC.swift
//  RainyShiny
//
//  Created by Settar Hummetli on 7/17/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentWeatherIV: UIImageView!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downlaodWeatherDetails {
            self.updateMainUI()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    
    
    func updateMainUI() {
        dateLbl.text = currentWeather.date
        currentTempLbl.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLbl.text = currentWeather.weatherType
        locationLbl.text = currentWeather.cityName
        currentWeatherIV.image = UIImage(named: currentWeather.weatherType)
        
        print("In UI weahther type = \(currentWeather.weatherType)")
        
    }
}

