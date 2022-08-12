//
//  AvailableViewController.swift
//  TaskApp
//
//  Created by CV on 8/29/21.
//

import UIKit

class AvailableViewController: UIViewController {

    @IBOutlet weak var availableItemTV: UITableView!
   
    var animals: [String] = ["Horse", "Cow", "Camel", "Pig", "Sheep", "Goat"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        availableItemTV.delegate = self
        availableItemTV.dataSource = self
        availableItemTV.register(UINib(nibName: "AvailablesCell", bundle: nil), forCellReuseIdentifier: "AvailablesCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alert.dismiss(animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AvailableViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = availableItemTV.dequeueReusableCell(withIdentifier: "AvailablesCell", for: indexPath)as! AvailablesCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

//    func tableView(_ tableView: UITableView,
//                    leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//     {
//         let editAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//                 success(true)
//             })
//    editAction.backgroundColor = .blue
//
//             return UISwipeActionsConfiguration(actions: [editAction])
//     }
//
//     func tableView(_ tableView: UITableView,
//                    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//     {
//         let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//             success(true)
//         })
//         deleteAction.backgroundColor = .red
//
//         return UISwipeActionsConfiguration(actions: [deleteAction])
//     }
   
    
}
    

