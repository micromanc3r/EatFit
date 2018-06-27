//
//  ComponentRatioViewController.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit

class ComponentRatioViewController: UIViewController {
    weak var delegate: ComponentRatioDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        generateLayout()
    }
}

extension ComponentRatioViewController {
    func generateLayout() {
        title = R.string.localizable.cr_title()
        view.backgroundColor = .cyan
    }
}
