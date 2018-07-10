//
//  UIView+Animations.swift
//  Animations demo
//
//  Created by Miroslav Sliacky on 28/01/2017.
//  Copyright © 2017 micromanc3r. All rights reserved.
//

import UIKit

extension UIView {
    
    func hideGracefully(duration: TimeInterval,
                        delay: TimeInterval,
                        options: UIViewAnimationOptions,
                        completion: ((Bool) -> Void)? = nil) {
        setAlphaGracefully(alpha: 0.0,
                           duration: duration,
                           delay: delay,
                           options: options,
                           completion: completion)
    }
    
    func hideGracefully(completion: ((Bool) -> Void)? = nil) {
        hideGracefully(duration: 0.2,
                       delay: 0.0,
                       options: [.curveEaseOut],
                       completion: completion)
    }
    
    func showGracefully(duration: TimeInterval,
                        delay: TimeInterval,
                        options: UIViewAnimationOptions,
                        completion: ((Bool) -> Void)? = nil) {
        setAlphaGracefully(alpha: 1.0,
                           duration: duration,
                           delay: delay,
                           options: options,
                           completion: completion)
    }
    
    func showGracefully(completion: ((Bool) -> Void)? = nil) {
        showGracefully(duration: 0.2,
                       delay: 0.0,
                       options: [.curveEaseIn],
                       completion: completion)
    }
    
    func setAlphaGracefully(alpha: CGFloat,
                            duration: TimeInterval,
                            delay: TimeInterval,
                            options: UIViewAnimationOptions,
                            completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: {
                        self.alpha = alpha
        },
                       completion: completion)
    }
    
    func bounceIn(duration: TimeInterval,
                  delay: TimeInterval,
                  options: UIViewAnimationOptions,
                  completion: ((Bool) -> Void)? = nil) {
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: {
                        self.alpha = 1.0
                        self.transform = CGAffineTransform(scaleX: 1, y: 1)
        },
                       completion: completion)
    }
    
    func bounceIn(completion: ((Bool) -> Void)? = nil) {
        bounceIn(duration: 0.4,
                 delay: 0.0,
                 options: [.allowUserInteraction, .curveEaseOut],
                 completion: completion)
    }
}
