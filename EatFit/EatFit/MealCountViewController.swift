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

    override func viewDidLoad() {
        super.viewDidLoad()

        generateLayout()
    }
}

extension MealCountViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in _: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return 6
    }

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        return "\(row + 1)"
    }

    func generateLayout() {
        view.backgroundColor = .white

        countPicker.dataSource = self
        countPicker.delegate = self

        view.addSubview(countPicker)

        constrain(countPicker) { countPicker in
            countPicker.center == countPicker.superview!.center
        }
    }
}
