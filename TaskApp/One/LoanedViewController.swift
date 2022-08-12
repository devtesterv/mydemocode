//
//  LoanedViewController.swift
//  TaskApp
//
//  Created by CV on 8/29/21.
//

import UIKit

protocol moveNextDelegate{
    func didSelectIndex(index:Int)
    
}
class LoanedViewController: UIViewController{
    var moveDelegate:moveNextDelegate?
    

    @IBOutlet weak var loanedTV: UITableView!
    var parentNavigation: UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()

//        LoanedCell
        loanedTV.delegate = self
        loanedTV.dataSource = self
        loanedTV.register(UINib(nibName: "LoanedCell", bundle: nil), forCellReuseIdentifier: "LoanedCell")
    }
    
    
}
extension LoanedViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = loanedTV.dequeueReusableCell(withIdentifier: "LoanedCell", for: indexPath)as! LoanedCell
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "AvailableViewController") as? AvailableViewController else { return }
//        self.parentNavigation?.present(vc, animated: true, completion: nil)
        moveDelegate?.didSelectIndex(index: 1)
    }
    
}
