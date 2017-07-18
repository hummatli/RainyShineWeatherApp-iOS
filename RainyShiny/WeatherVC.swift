//
//  WheatherVC.swift
//  RainyShiny
//
//  Created by Settar Hummetli on 7/17/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentWeatherIV: UIImageView!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude

//            print("Long \(currentLocation.coordinate.longitude), Lat \(currentLocation.coordinate.latitude)")
//            print("Location class = Long \(Location.sharedInstance.longitude), Lat \(Location.sharedInstance.latitude)")
            
            currentWeather.downlaodWeatherDetails {
                self.downloadForcstData {
                    self.updateMainUI()
                }
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func downloadForcstData(completed: @escaping DownloadComplete){
        //Downloading forcast eather data for Table View
        let forecastURL = URL(string: FORECAST_URL)!
        
        Alamofire.request(forecastURL).responseJSON { respons in
            let result = respons.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print("Obj = \(obj)")
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
                
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
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

