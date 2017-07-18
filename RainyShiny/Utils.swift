//
//  Utils.swift
//  RainyShiny
//
//  Created by Settar Hummetli on 7/18/17.
//  Copyright © 2017 Settar Hummetli. All rights reserved.
//

import Foundation


func kelvinToFaranheit(tempKelvin: Double) -> Double {
    let kelvinToFarenheitPreDivision = (tempKelvin * (9 / 5) - 459.67)
    
    let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision))
    
    return kelvinToFarenheit
}
