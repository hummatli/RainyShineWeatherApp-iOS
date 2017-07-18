//
//  Location.swift
//  RainyShiny
//
//  Created by Settar Hummetli on 7/18/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
