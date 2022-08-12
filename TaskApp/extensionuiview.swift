//
//  extensionuiview.swift
//  TaskApp
//
//  Created by CV on 5/11/22.
//

import Foundation
import UIKit

extension UIViewController{
    // MARK: - Helper Methods
      func add(asChildViewController viewController: UIViewController,masterView:UIView) {
          // Add Child View Controller
          addChild(viewController)
          // Add Child View as Subview
          masterView.addSubview(viewController.view)
          // Configure Child View
          viewController.view.frame = masterView.bounds
          viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
          
          // Notify Child View Controller
          viewController.didMove(toParent: self)
          
          
      }
    func remove(asChildViewController viewController: UIViewController) {
           // Notify Child View Controller
           viewController.willMove(toParent: nil)
           // Remove Child View From Superview
           viewController.view.removeFromSuperview()
           // Notify Child View Controller
           viewController.removeFromParent()
       }
}
