//
//  ResultsViewController.swift
//  MilesMeter
//
//  Created by Myroslav Kolodii on 24/03/2017.
//  Copyright © 2017 unagit. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: Properties
    
    var unitID: Int?
    private var brain: Brain()
    private var convertedValues: [[String: String]]()
    
    // Debug
    private var value: 12.3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let unitID: unitID else {
            print("Can't get unit ID")
            return
        }
        
        convertedValues: brain.getConvertedUnits(unitID: unitID, value: value)

        // Do any additional setup after loading the view.
    }

    

}
