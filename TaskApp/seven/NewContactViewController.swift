////
////  NewContactViewController.swift
////  TaskApp
////
////  Created by CV on 6/5/22.
////
//
//import UIKit
//import Contacts
//import Foundation
//import CoreMedia
//
//
//struct FetchedContact {
//    var id: String?
//    var firstName: String?
//    var lastName: String?
//    var telephone: [String]?
//    var email: [String]?
//    var isSelected: Bool?
//}
//
//protocol contactListsDelegate{
//    func contactListSelect(data :[ContactDetails]?)
//}
//
//class NewContactViewController: UIViewController {
//    @IBOutlet weak var peopleAttendingTableView: UITableView!{
//        didSet{
//            self.peopleAttendingTableView.separatorStyle = .none
//        }
//    }
//    @IBOutlet weak var inviteButton: UIButton!
//    @IBOutlet weak var inviteBtnView: UIView!
//    
//    @IBOutlet weak var searchBar: UISearchBar!
//    @IBOutlet weak var searchBarView: UIView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//    
//
//}
