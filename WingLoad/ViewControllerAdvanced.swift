//
//  ViewController.swift
//  WingLoad
//
//  Created by Jon Hemstreet on 6/4/17.
//  Copyright © 2017 Hemstreet. All rights reserved.
//

import UIKit

class ViewControllerAdvanced: UIViewController {

    // Wingload format
    let wingLoadFormat = "%.2f"
    
    // Weight Items
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightText: UITextField!
    
    // Equipment Weight Items
    @IBOutlet weak var equipmentSlider: UISlider!
    @IBOutlet weak var equipmentWeightText: UITextField!
    
    // Canopy Size Items
    @IBOutlet weak var canopySizeSlider: UISlider!
    @IBOutlet weak var canopySizeText: UITextField!
    
    // Wing Loading Items
    @IBOutlet weak var wingLoadingSlider: UISlider!
    @IBOutlet weak var wingLoadingText: UITextField!
    
    override func viewDidLoad() {
        initializeSliderLabels();
        super.viewDidLoad()
        // call our initialize function(s)
    }
    
    // overide touch to close keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    // Setup default values for the slider labels
    func initializeSliderLabels() {
        weightText.text          = String(Int(weightSlider.value));
        equipmentWeightText.text = String(Int(equipmentSlider.value));
        canopySizeText.text      = String(Int(canopySizeSlider.value));
        wingLoadingText.text     = String(format: wingLoadFormat, wingLoadingSlider.value);
    }

    @IBAction func didTouchUpUnits(_ sender: Any) {
        print("Toggled Units");
    }

    @IBAction func didTouchUpTandemMode(_ sender: Any) {
        print("Toggled Tandem Mode");
    }

    @IBAction func didEnterWeight(_ sender: Any) {
        let value = Int(weightText.text!);
        changeWeightValue(value: value!);
        valueChanged();
    }
    
    @IBAction func didEnterEquipmentWeight(_ sender: Any) {
        let value = Int(equipmentWeightText.text!);
        changeEquipmentWeightValue(value: value!);
        valueChanged();
    }
    
    @IBAction func didEnterCanopySize(_ sender: Any) {
        let value = Int(canopySizeText.text!);
        changeCanopySizeValue(value: value!)
        valueChanged();
    }

    @IBAction func didEnterWingLoading(_ sender: Any) {
        let value = Float(wingLoadingText.text!);
        changeWingLoadingValue(value: value!)
        valueChanged();
    }
    
    func changeWeightValue(value: Int) {
        weightSlider.value = Float(value);
        weightText.text = String(value);
        valueChanged();
    }
    
    func changeEquipmentWeightValue(value: Int) {
        equipmentSlider.value = Float(value);
        equipmentWeightText.text = String(value);
        valueChanged();
    }
    
    func changeCanopySizeValue(value: Int) {
        canopySizeSlider.value = Float(value);
        canopySizeText.text = String(value);
        valueChanged();
    }
    
    func changeWingLoadingValue(value: Float) {
        wingLoadingSlider.value = value;
        wingLoadingText.text = String(format: wingLoadFormat, value)
        valueChanged();
    }
    
    @IBAction func didChangeWeightValue(_ sender: Any) {
        let value = Int(weightSlider.value);
        changeWeightValue(value: value)
        valueChanged();
    }
    
    
    @IBAction func didChangeEquipmentWeightValue(_ sender: Any) {
        let value = Int(equipmentSlider.value);
        changeEquipmentWeightValue(value: value);
        valueChanged();
    }
    @IBAction func didChangeCanopySizeValue(_ sender: Any) {
        let value = Int(canopySizeSlider.value);
        changeCanopySizeValue(value: value);
        valueChanged();
    }
    @IBAction func didChangeWingLoadingValue(_ sender: Any) {
        let value = wingLoadingSlider.value;
        print("Wingloading slider changed to", value);
        changeWingLoadingValue(value: value);
        valueChanged();
    }
    func valueChanged() {
        
        let weight             = weightSlider.value;
        let equipmentWeight    = equipmentSlider.value;
        let canopySize         = canopySizeSlider.value;
        let calculatedWingLoad = calculateWingLoad(weight: weight,
                                                   equipmentWeight: equipmentWeight,
                                                   canopySize: canopySize);
        
        wingLoadingSlider.value = calculatedWingLoad;
        wingLoadingText.text   = String(format: wingLoadFormat, calculatedWingLoad);
    }
    
    func calculateWingLoad(weight: Float,
                           equipmentWeight: Float,
                           canopySize: Float) -> Float {
        
        let calculatedWingLoad = (weight + equipmentWeight) / canopySize;
        print("Wing Load", calculatedWingLoad);
    
        return calculatedWingLoad;
    }

}

