//
//  CitiesViewModel.swift
//  SamsungStore
//
//  Created by Bair Nadtsalov on 21.12.2022.
//

import Foundation

class CitiesViewModel {
    
    // MARK: - Private variables
    
    private let cities: [City] = [City(name: "aa1"),
                                  City(name: "ff1"),
                                  City(name: "gg1")]
    
    func numberOfCities() -> Int {
        cities.count
    }
    
    func cityForRowAt(indexPath: IndexPath) -> City {
        cities[indexPath.row]
    }
}
