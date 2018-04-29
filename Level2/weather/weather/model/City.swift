//
//  City.swift
//  weather
//
//  Created by Ильдар on 26.04.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import Foundation

class City {
    static let CITIES = ["Moscow", "Samara", "Ufa", "London"]
    
    static let ICON_NAMES: [String] = ["sun", "rain", "greyFall"]
    
    var selectedCities = CITIES.suffix(from: 2).sorted()

    
    
    class func getAllCities() -> [String] {
        return CITIES
    }
    
    func getSelectedCities() -> [String] {
        print("get selectedCities = \(selectedCities.count)")
        return selectedCities
    }
    
    class func getIconNames() -> [String] {
        return ICON_NAMES
    }
    
    
    func addSelected(_ selectedCity: String)  {
        selectedCities.append(selectedCity)
    }
}
