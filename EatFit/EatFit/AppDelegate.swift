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
//    var window: UIWindow?

    var coordinator: MainCoordinator?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpLogs()

        startCoordinatorFlow()

        return true
    }

    func startCoordinatorFlow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = MainCoordinator(withWindow: window,
                                      andStorage: DefaultMealSettingsStorage())
        coordinator?.start()
    }

    func setUpLogs() {
        #if DEBUG
            MLogger.logLevel = .verbose
        #else
            MLogger.logLevel = .error
        #endif
    }
}
