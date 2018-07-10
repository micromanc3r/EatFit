//
//  SetupOkViewController.swift
//  EatFit
//
//  Created by micromanc3r on 10/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit
import Cartography

class SetupOkViewController: UIViewController {
    let okLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLayout()
    }
}

extension SetupOkViewController {
    func prepareLayout() {
        view.backgroundColor = .white
        
        prepareOkLabel()
        
        constrain(okLabel) { okLabel in
            okLabel.center == okLabel.superview!.center
        }
    }
    
    private func prepareOkLabel() {
        okLabel.text = R.string.localizable.ok_title()
        okLabel.font = UIFont.systemFont(ofSize: 36,
                                         weight: .heavy)
        view.addSubview(okLabel)
    }
}
