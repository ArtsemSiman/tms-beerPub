//
//  ViewController.swift
//  PivoBar
//
//  Created by Артём Симан on 18.02.22.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    // MARK: - Override properties
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
   private let volumes: [Double] = [0.5, 1, 1.5, 2]
    
    // MARK: - IBOutlets

    @IBOutlet weak var lastMoney: UILabel!
    
    
    @IBOutlet weak var lastSell: UILabel!
    
    @IBOutlet var beers: [UILabel]!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    startNewDay(self)
        for index in 0..<beers.count {
            updateBeer(withIndex: index)
        }
    }
    // MARK: - Public methods
    
   
    // MARK: - Private methods
    private func setLastSell(isSuccessful: Bool) {
        lastSell.text = """
         Последняя продажа:
        \(isSuccessful ? "продажа" : "неуспешна" )
        """
    }
    
    
    private func updateBeer(withIndex index: Int) {
        guard index >= 0 && index < beers.count else {
            return
        }
        
        beers[index].text = PubManager.shared.checkRemainingVolume(onTap: index)
    }
    
    // MARK: - IBActions
    @IBAction func updateVolume(_ sender: UIButton) {
        updateBeer(withIndex: sender.tag)
    }
    
    
    @IBAction func checkMoney(_ sender: Any) {
        let currentMoney = PubManager.shared.checkMoney()
        lastMoney.text = "Последняя обновленная выручка:\n\(currentMoney)"
    }
    
    @IBAction func startNewDay(_ sender: Any) {
        PubManager.shared.startNewDay()
        checkMoney(self)
    }
    
    
    @IBAction func sellBeer(_ sender: UIButton) {
        
        let beerIndex = (sender.tag / 10) % 10
        let volumeIndex = (sender.tag % 10)
        
        guard volumeIndex >= 0, volumeIndex < volumes.count else {
            setLastSell(isSuccessful: false)
            return
            
        }
        let volume = volumes[volumeIndex]
        let isSuccessfulSell = PubManager.shared.sellBeer(onTap: beerIndex, volume: volume)
        updateBeer(withIndex: beerIndex)

        setLastSell(isSuccessful: isSuccessfulSell)
    }


/* func fff (num: Double?) {
    if num == nil {
        lastSell.text = "нет продажи")
    } else { print ("sell")
        
    }
} */
}
