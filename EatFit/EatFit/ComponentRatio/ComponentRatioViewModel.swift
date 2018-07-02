//
//  ComponentRatioViewModel.swift
//  EatFit
//
//  Created by micromanc3r on 03/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation
import MicroLogger

class ComponentRatioViewModel {
    var selectedMeal = 0 {
        didSet {
            MLogger.logVerbose(sender: self,
                               andMessage: "\(selectedMeal)") // cannot be nil
        }
    }
}
