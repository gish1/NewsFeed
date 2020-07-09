//
//  UIWindow+Ext.swift
//  NewsFeed
//
//  Created by Пк on 06.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

extension UIWindow {
    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController  = self.rootViewController {
            return UIWindow.getVisibleViewControllerFrom(rootViewController)
        }
        return nil
    }
    
    class func getVisibleViewControllerFrom(_ vc: UIViewController) -> UIViewController {
        if let navigationController = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(navigationController.visibleViewController!)
            
        } else if let tabBarController = vc as? UITabBarController {
            
            return UIWindow.getVisibleViewControllerFrom(tabBarController.selectedViewController!)
            
        } else if let
            pageViewController = vc as? UIPageViewController,
            let currentVC = pageViewController.viewControllers?.first {
            return UIWindow.getVisibleViewControllerFrom(currentVC)
            
        } else {
            
            if let presentedViewController = vc.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(presentedViewController)
                
            } else {
                return vc
            }
        }
    }
}
