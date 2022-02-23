//
//  PubManager.swift
//  PivoBar
//
//  Created by Артём Симан on 18.02.22.
//

import Foundation
class PubManager {
    
    var beers: [BeerModel] = [
        BeerModel(name: "IPA",
                  price: 110,
                  country: "Rus",
                  remainingVolume: 500),
        BeerModel(name: "APA",
                  price: 125,
                  country: "USA",
                  remainingVolume: 50),
        BeerModel(name: "Blanche",
                  price: 112.5,
                  country: "Belgia",
                  remainingVolume: 100),
        BeerModel(name: "Rouge",
                  price: 150,
                  country: "Belgia",
                  remainingVolume: 112.5)]
    
    private var money: Double = 0.0
    
    static let shared: PubManager = PubManager()
    
    private init() { }
    
    func sellBeer(onTap index: Int, volume: Double) -> Bool {
        guard index >= 0, index < beers.count else {return false}
        guard beers[index].remainingVolume >= volume else {return false}
        money += beers[index].price * volume
        beers[index].remainingVolume -= volume
        return true
    }
    
    func checkMoney() -> Double { money }
    
    func startNewDay() {
        money = 0
    }
    
    func checkRemainingVolume(onTap index: Int) -> String {
        guard index >= 0 && index < beers.count else {return "Ошибка"}
        return beers[index].getDescription()
}
}
