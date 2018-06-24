//
//  AppDelegate.swift
//  EatFit
//
//  Created by Miroslav Sliacky on 13/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import MicroLogger
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setUpLogs()

        return true
    }

    func setUpLogs() {
        #if DEBUG
            MLogger.logLevel = .verbose
        #else
            MLogger.logLevel = .error
        #endif
    }
}
