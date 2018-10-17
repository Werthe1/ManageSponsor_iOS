//
//  TabbarAnimation.swift
//  ManageSponsor
//
//  Created by hyerikim on 13/10/2018.
//  Copyright © 2018 hyerikim. All rights reserved.
//

import UIKit

class TabbarAnimation : NSObject, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideAnimation(tabBarController: tabBarController)
    }
}

class SlideAnimation : NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var transition : UIViewControllerContextTransitioning?
    var tabBar : UITabBarController!
    var index = 0
    
    init(tabBarController : UITabBarController) {
        self.tabBar = tabBarController
        self.index = tabBarController.selectedIndex
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transition = transitionContext
        let container = transitionContext.containerView
        
        let from = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        let to = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        container.addSubview(to!.view)
        
        var width = to?.view.bounds.width
        
        if tabBar.selectedIndex < index {
            width = -width!
        }
        
        to?.view.transform = CGAffineTransform(translationX: width!, y: 0)
        
        UIView.animate(withDuration: self.transitionDuration(using: (self.transition)), animations: {
            to?.view.transform = CGAffineTransform.identity
            from?.view.transform = CGAffineTransform(translationX: -width!, y: 0)
            
        }, completion : { _ in
            from?.view.transform = CGAffineTransform.identity
            self.transition?.completeTransition(!(self.transition?.transitionWasCancelled)!)
        })
    }
}
