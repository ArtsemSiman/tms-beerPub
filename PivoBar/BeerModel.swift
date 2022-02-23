//
//  BeerModel.swift
//  PivoBar
//
//  Created by Артём Симан on 18.02.22.
//

import Foundation

struct BeerModel {
    let name: String
    let price: Double
    let country: String
    var remainingVolume: Double
    
    func getDescription() -> String {
        """
        \(name), \(country), \(price) $/l
        Остаток: \(remainingVolume) l
        """
    }
}
