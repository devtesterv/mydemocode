//
//  ParentViewController.swift
//  TaskApp
//
//  Created by CV on 5/11/22.
//

import UIKit

class ParentViewController: UIViewController {

    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var optionBtn: UIButton!
    
    var selectedScreenTag = 0
    
    lazy var childOneViewController: ChildOneViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ChildOneViewController") as? ChildOneViewController{

            return viewController
        }else{
            return ChildOneViewController()
        }
    }()
    lazy var childTwoViewController: ChildTwoViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ChildTwoViewController") as? ChildTwoViewController{

            return viewController
        }else{
            return ChildTwoViewController()
        }
    }()
    lazy var childThreeViewController: ChildThreeViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ChildThreeViewController") as? ChildThreeViewController{

            return viewController
        }else{
            return ChildThreeViewController()
        }
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        add(asChildViewController: self.childOneViewController, masterView: self.baseView)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func optionClicked(_ sender: UIButton) {
        if sender.tag == 1 {
            selectedScreenTag = 1
            add(asChildViewController: self.childOneViewController, masterView: self.baseView)
            remove(asChildViewController:   self.childTwoViewController)
            remove(asChildViewController:   self.childThreeViewController)
        }else if sender.tag == 2{
            selectedScreenTag = 2
            add(asChildViewController: self.childTwoViewController, masterView: self.baseView)
            remove(asChildViewController:   self.childOneViewController)
            remove(asChildViewController:   self.childThreeViewController)
        }else if sender.tag == 3{
            selectedScreenTag = 3
            add(asChildViewController: self.childThreeViewController, masterView: self.baseView)
            remove(asChildViewController:   self.childTwoViewController)
            remove(asChildViewController:   self.childOneViewController)
        }
        
    }
    
    @IBAction func cleanAndSaveClicked(_ sender: UIButton) {
        if sender.tag == 1 {
            print(selectedScreenTag,"Clicked Buttom selectedScreenTag")
            if self.baseView.subviews.contains(childOneViewController.view) {
                let vc = childOneViewController
                print( vc.nameText)
            }
        }else if sender.tag == 2{
            print(selectedScreenTag,"Clicked Buttom selectedScreenTag")
            if self.baseView.subviews.contains(childOneViewController.view) {
                let vc = childOneViewController
                if vc.nameText != nil{
                    vc.nameText = ""
                    print( vc.nameText,"vc.nameTextvc.nameText")
                }else{
                }
            }
        }
    }
    
}
