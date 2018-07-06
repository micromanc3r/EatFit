//
//  ComponentRatioView.swift
//  EatFit
//
//  Created by micromanc3r on 28/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import UIKit

class ComponentRatioPickerView: UIView {
    let picker = UIPickerView()
    let pickerModel = ComponentRatioPickerViewModel()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        generateLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        generateLayout()
    }
}

extension ComponentRatioPickerView {
    func generateLayout() {
        setupPicker()

        constrain(picker) { picker in
            picker.left == picker.superview!.left
            picker.right == picker.superview!.right
            picker.bottom == picker.superview!.bottom
            picker.top == picker.superview!.top
        }
    }

    func setupPicker() {
        picker.dataSource = pickerModel
        picker.delegate = pickerModel
        addSubview(picker)
    }
}
