//
//  SelectMealViewController.swift
//  EatFit
//
//  Created by micromanc3r on 10/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import UIKit

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

        prepareTitleLabel()

        constrain(titleLabel) { titleLabel in
            titleLabel.top == titleLabel.superview!.safeAreaLayoutGuide.top + 24
            titleLabel.centerX == titleLabel.superview!.centerX
            titleLabel.left >= titleLabel.superview!.safeAreaLayoutGuide.left + 16
            titleLabel.right <= titleLabel.superview!.safeAreaLayoutGuide.right - 16
        }
    }

    private func prepareTitleLabel() {
        titleLabel.text = R.string.localizable.sm_title()
        titleLabel.font = UIFont.systemFont(ofSize: 36,
                                            weight: .heavy)
        view.addSubview(titleLabel)
    }
}
