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
    weak var delegate: SetupOkDelegate?
    let okLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        okLabel.bounceIn(duration: 1,
                         delay: 0.1,
                         options: UIViewAnimationOptions.curveEaseInOut) { _ in
            self.delegate?.canContinue()
        }
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
        okLabel.alpha = 0.0
        okLabel.text = R.string.localizable.ok_title()
        okLabel.font = UIFont.systemFont(ofSize: 36,
                                         weight: .heavy)
        view.addSubview(okLabel)
    }
}
