//
//  Utilities.swift
//  WingLoad
//
//  Created by Jon Hemstreet on 6/5/17.
//  Copyright © 2017 Hemstreet. All rights reserved.
//

import Foundation
class Utilities {
    func calculateWingLoad(weight: Float,
                           equipmentWeight: Float,
                           canopySize: Float) -> Float {
        
        let calculatedWingLoad = (weight + equipmentWeight) / canopySize;
        print("Wing Load", calculatedWingLoad);
        
        return calculatedWingLoad;
    }   
}
