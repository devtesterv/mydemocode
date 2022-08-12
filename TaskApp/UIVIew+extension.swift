//
//  UIVIew+extension.swift
//  TaskApp
//
//  Created by CV on 12/15/21.
//
import Foundation
import UIKit
extension UIViewController {
@IBAction func menuCustomClicked(_ sender: UIButton) {
   let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    nextViewController.modalPresentationStyle = .overCurrentContext
//        nextViewController.modalTransitionStyle = .crossDissolve
    self.present(nextViewController, animated:true, completion:nil)
}

@IBAction func menuBackClicked(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
}
@IBAction func  dismissClicked(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
}
}
