//
//  ViewControllerCombined.swift
//  WingLoad
//
//  Created by Jon Hemstreet on 6/5/17.
//  Copyright © 2017 Hemstreet. All rights reserved.
//

import UIKit

class ViewControllerSimple: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // overide touch to close keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var equipmentWeightInput: UITextField!
    @IBOutlet weak var canopySizeInput: UITextField!
    @IBOutlet weak var wingLoadLabel: UILabel!
    
    @IBAction func calculateWingLoad(_ sender: Any) {
        let weight = Float(weightInput.text!);
        let equipmentWeight = Float(equipmentWeightInput.text!);
        let canopySize = Float(canopySizeInput.text!);
        
        let calculatedWingLoad = (weight! + equipmentWeight!) / canopySize!;
        
        wingLoadLabel.text = String(format: "%.2f", calculatedWingLoad);
    }
}
