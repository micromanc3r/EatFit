//
//  ComponentRatioView.swift
//  EatFit
//
//  Created by micromanc3r on 28/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit
import Cartography

class ComponentRatioView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        generateLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        generateLayout()
    }
}

extension ComponentRatioView {
    func generateLayout() {
        
    }
}
