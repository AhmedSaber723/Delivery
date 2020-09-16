//
//  SlideInTransition.swift
//  Pharmcy
//
//  Created by Saber on 1/30/20.
//  Copyright © 2020 Saber. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = false
    let dimmingView = UIView()
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
       guard let toViewController = transitionContext.viewController(forKey: .to),
        let fromViewController = transitionContext.viewController(forKey: .from) else{return}
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width
        let finalHeight = fromViewController.view.bounds.height
        
        if isPresenting {
            //Add dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            //Add menu View controller to container
            containerView.addSubview(toViewController.view)
            
            //init fram off the screen
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                toViewController.view.frame = CGRect(x: finalWidth * 1.2, y: 0, width: finalWidth * 0.8 , height: finalHeight)
                
            }else {
                toViewController.view.frame = CGRect(x: -finalWidth , y: 0, width: finalWidth * 0.8 , height: finalHeight)
            }
            
           
        }
        
        
        // animate on screen
        let transform = {
            self.dimmingView.alpha = 0.5
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            toViewController.view.transform = CGAffineTransform(translationX: -finalWidth, y: 0)
                
            }else {
                 toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
            }
         
        }
        
        
        //animate back off screen
        let identity = {
            self.dimmingView.alpha = 0.0
           
            fromViewController.view.transform = .identity
        }
        
        // animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {self.isPresenting ? transform() : identity()})
        { (_) in
            transitionContext.completeTransition(!isCancelled)
        }

    }
}
