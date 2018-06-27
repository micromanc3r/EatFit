//
//  ViewController.swift
//  EatFit
//
//  Created by Miroslav Sliacky on 13/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import UIKit

class MealCountViewController: UIViewController {
    let countPicker = UIPickerView()
    let viewModel = MealCountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        generateLayout()
    }
}

extension MealCountViewController {
    func generateLayout() {
        view.backgroundColor = .white

        setupCountPicker()
        
        constrain(countPicker) { countPicker in
            countPicker.center == countPicker.superview!.center
        }
    }
    
    fileprivate func setupCountPicker() {
        countPicker.dataSource = viewModel
        countPicker.delegate = viewModel
        
        view.addSubview(countPicker)
    }
}
