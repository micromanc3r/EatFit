//
//  ViewController.swift
//  EatFit
//
//  Created by Miroslav Sliacky on 13/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import UIKit

class MealCountViewController: NIViewController {
    let countPicker = UIPickerView()
    let titleLabel = UILabel()
    let confirmButton = UIButton()

    let viewModel = MealCountViewModel()
    weak var delegate: MealCountDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareLayout()
    }

    @objc func confirmSelection() {
        delegate?.mealCountSelected(count: countPicker.selectedRow(inComponent: 0) + MealCount.minMeals)
    }
}

extension MealCountViewController {
    func prepareLayout() {
        title = R.string.localizable.mc_title()
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

    private func setupCountPicker() {
        countPicker.dataSource = viewModel
        countPicker.delegate = viewModel
        countPicker.selectRow(viewModel.row(fromMealCount: delegate?.defaultMealCount()), inComponent: 0, animated: false)

        view.addSubview(countPicker)
    }

    private func setupTitleLabel() {
        titleLabel.text = R.string.localizable.mc_label_title()
        titleLabel.textAlignment = .center

        view.addSubview(titleLabel)
    }

    private func setupConfirmButton() {
        confirmButton.setTitle(R.string.localizable.mc_button(), for: .normal)
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.addTarget(self, action: #selector(confirmSelection), for: .touchUpInside)

        view.addSubview(confirmButton)
    }
}
