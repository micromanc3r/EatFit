//
//  SelectMealViewController.swift
//  EatFit
//
//  Created by micromanc3r on 10/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit
import Cartography

class SelectMealViewController: UIViewController {
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLayout()
    }
}

extension SelectMealViewController {
    func prepareLayout() {
        view.backgroundColor = .white
        
        titleLabel.text = "Temp label"
        view.addSubview(titleLabel)
        
        constrain(titleLabel) { titleLabel in
            titleLabel.center == titleLabel.superview!.center
        }
    }
}
