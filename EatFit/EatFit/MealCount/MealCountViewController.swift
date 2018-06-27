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
    let titleLabel = UILabel()
    let confirmButton = UIButton()

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
        setupTitleLabel()
        setupConfirmButton()

        constrain(countPicker, titleLabel, confirmButton) { countPicker, titleLabel, confirmButton in
            countPicker.center == countPicker.superview!.center

            titleLabel.bottom == countPicker.top - 8
            titleLabel.left == titleLabel.superview!.left + 8
            titleLabel.right == titleLabel.superview!.right - 8

            confirmButton.top == countPicker.bottom + 8
            confirmButton.left >= confirmButton.superview!.left + 8
            confirmButton.right <= confirmButton.superview!.right - 8
            confirmButton.centerX == confirmButton.superview!.centerX
        }
    }

    fileprivate func setupCountPicker() {
        countPicker.dataSource = viewModel
        countPicker.delegate = viewModel

        view.addSubview(countPicker)
    }

    fileprivate func setupTitleLabel() {
        titleLabel.text = R.string.localizable.mc_title()
        titleLabel.textAlignment = .center

        view.addSubview(titleLabel)
    }

    fileprivate func setupConfirmButton() {
        confirmButton.setTitle(R.string.localizable.mc_button(),
                               for: .normal)
        confirmButton.setTitleColor(.black,
                                    for: .normal)

        view.addSubview(confirmButton)
    }
}
