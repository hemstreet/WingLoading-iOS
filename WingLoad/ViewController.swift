//
//  ViewController.swift
//  WingLoad
//
//  Created by Jon Hemstreet on 6/4/17.
//  Copyright © 2017 Hemstreet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Weight Items
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    // Equipment Weight Items
    @IBOutlet weak var equipmentSlider: UISlider!
    @IBOutlet weak var equipmentLabel: UILabel!
    
    // Canopy Size Items
    @IBOutlet weak var canopySizeSlider: UISlider!
    @IBOutlet weak var canopySizeLabel: UILabel!
    
    // Wing Loading Items
    @IBOutlet weak var wingLoadingSlider: UISlider!
    @IBOutlet weak var wingLoadingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call our initialize function(s)
        initializeSliderLabels();
    }
    
    // Setup default values for the slider labels
    func initializeSliderLabels() {
        weightLabel.text      = String(weightSlider.value);
        equipmentLabel.text   = String(equipmentSlider.value);
        canopySizeLabel.text  = String(canopySizeSlider.value);
        wingLoadingLabel.text = String(wingLoadingSlider.value);
    }

    @IBAction func didTouchUpUnits(_ sender: Any) {
        print("Toggled Units");
    }

    @IBAction func didTouchUpTandemMode(_ sender: Any) {
        print("Toggled Tandem Mode");
    }

    @IBAction func didChangeWeightValue(_ sender: Any) {
        let value = weightSlider.value;
        weightLabel.text = String(value);
        sliderChange();
    }
    @IBAction func didChangeEquipmentWeightValue(_ sender: Any) {
        let value = equipmentSlider.value;
        equipmentLabel.text = String(value);
        sliderChange();
    }
    @IBAction func didChangeCanopySizeValue(_ sender: Any) {
        let value = canopySizeSlider.value;
        canopySizeLabel.text = String(value);
        sliderChange();
    }
    @IBAction func didChangeWingLoadingValue(_ sender: Any) {
        let value = wingLoadingSlider.value;
        print("Wingloading slider changed to", value);
        wingLoadingLabel.text = String(value)
        sliderChange();
    }
    func sliderChange() {
        let weight             = weightSlider.value;
        let equipmentWeight    = equipmentSlider.value;
        let canopySize         = canopySizeSlider.value;
        let calculatedWingLoad = calculateWingLoad(weight: weight,
                                                   equipmentWeight: equipmentWeight,
                                                   canopySize: canopySize);
        
        wingLoadingSlider.value = calculatedWingLoad;
        wingLoadingLabel.text   = String(calculatedWingLoad);
    }
    func calculateWingLoad(weight: Float,
                           equipmentWeight: Float,
                           canopySize: Float) -> Float {
        
        let calculatedWingLoad = (weight + equipmentWeight) / canopySize;
        print("Wing Load", calculatedWingLoad);
    
        return calculatedWingLoad;
    }

}

