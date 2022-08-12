//
//  noteContact.swift
//  TaskApp
//
//  Created by CV on 5/24/22.
//

//old
//
//  ContactsViewController.swift
//  TaskApp
//
//  Created by CV on 4/13/22.
//
//
//import UIKit
//import Contacts
//import ContactsUI
//import Foundation
//
//
//struct ContactDetails {
//    var Name: String?
//    var Email: String?
//    var Phone: String?
//    var imgData: Data?
//}
//enum ContactType : String {
//    case Email = "email"
//    case Phone = "phone"
//}
//class UserDefaultsManager {
//    
//    static let shared: UserDefaultsManager = {
//        let instance = UserDefaultsManager()
//        return instance
//    }()
//   
//    var phoneNumber: String {
//            get {
//             return UserDefaults.standard.string(forKey: UserDefaultsKey.PHONE) ?? ""
//            }
//            set {
//                UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.PHONE)
//            }
//        }
//}
//struct UserDefaultsKey {
//    static let PHONE = "phone"
//    
//}
//class ContactsViewController: UIViewController,CNContactPickerDelegate {
//    @IBOutlet weak var testLb: UILabel!
//    var contactForPeople:Bool = false
//    var chosenContactType : String = ""
//    var contactType : String = ""
//    var contactD = [String]()
//    var peopleList = [ContactDetails]()
//    var chosenPhoneCount = 0
//
//    @IBOutlet weak var listTV: UITableView!
//    
//    
//    @IBOutlet weak var mobileNumberTF: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        listTV.delegate = self
//        listTV.dataSource = self
//        listTV.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
//        
//        
////        UserDefaultsManager.shared.phoneNumber = "9894969851"
////        testLb.text = "௧௯"
//        
////        print(contacts[0].givenName)
////        print(contacts[0].phoneNumbers)
////        print(contacts[0].emailAddresses)
////        print(contacts)
//        // Do any additional setup after loading the view.
////        for ContctNumVar: CNLabeledValue in contacts.phoneNumbers
////         {
////             let MobNumVar  = (ContctNumVar.value as! CNPhoneNumber).valueForKey("digits") as? String
////             print(MobNumVar!)
////         }
//        
//      
//        
//    }
//    @IBAction func click_Contact(_ sender: UIButton) {
//       
////        if let url = URL(string: "tel://\(UserDefaultsManager.shared.phoneNumber )"), UIApplication.shared.canOpenURL(url) {
////            if #available(iOS 10, *) {
////                UIApplication.shared.open(url)
////            } else {
////                UIApplication.shared.openURL(url)
////            }
////        }
//        
////        let vc = CNContactPickerViewController()
////        vc.delegate = self
////        self.present(vc, animated: true)
//        let alertController = UIAlertController(title: "Alert title", message: "Message to display", preferredStyle: .alert)
//        // Create OK button
//        let OKAction = UIAlertAction(title: "phone", style: .default) {
//            (action: UIAlertAction!) in
//            sender.tag == 0
//            self.contactType = ContactType.Email.rawValue
//            let cnPicker = CNContactPickerViewController()
//            cnPicker.delegate = self
//            self.present(cnPicker, animated: true, completion: nil)
//        }
//        
//        alertController.addAction(OKAction)
//        // Create Cancel button
//        let cancelAction = UIAlertAction(title: "email", style: .default) {
//            (action: UIAlertAction!) in
//            sender.tag == 1
//            self.contactType = ContactType.Phone.rawValue
//            let cnPicker = CNContactPickerViewController()
//            cnPicker.delegate = self
//            self.present(cnPicker, animated: true, completion: nil)
//        }
//        alertController.addAction(cancelAction)
//        // Present Dialog message
//        self.present(alertController, animated: true, completion: nil)
//        
//    }
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
////        for numbers: CNLabeledValue in contacts.phoneNumbers {
////            let numberValue = numbers.value
////
////            let countryCode = numberValue.value(forKey: "countryCode") as? String
////            let digits = numberValue.value(forKey: "digits") as? String
////            print(digits ?? "","=======digits===")
////            print(countryCode ?? "","=======countryCode===")
////
////           }
//        contacts.forEach { contact in
//
//            let countryCodePeople = "+91 "
////            txtFieldInvitePeopleCountry.text?.components(separatedBy: " ")
//                var phoneVal = 0
//                let phoneArr = contact.phoneNumbers
//                let removedSpaces = phoneArr.first?.value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
//                let removedSymbols = removedSpaces?.components(separatedBy: CharacterSet.symbols).joined(separator: "")
//                let removedPunctuation = removedSymbols?.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//                let phone = removedPunctuation
//                for _ in phoneArr {
//                    phoneVal += 1
//                }
//                if phoneVal == 0 {
//
//                }
//                else if contactForPeople == false && phoneVal == 1 {
//
//                    let contactList = [phone ?? ""]
//
//                    for contactLists in contactList {
////                          print(contactLists)
//                        testLb.text = contactLists
//                        self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "", Phone: contactLists, imgData: contact.thumbnailImageData))
//                    }
//                }
//                else if contactForPeople == true && phoneVal >= 2 {
//                    self.dismiss(animated: true, completion: nil)
//                    let alert = UIAlertController(title: "Please choose any one of the numbers", message: nil, preferredStyle: .actionSheet)
//                    for a in 1...phoneVal {
//                        alert.addAction(UIAlertAction(title: "\(phoneArr[a-1].value.stringValue)", style: .default, handler:{ (UIAlertAction) in
//                            let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
//                            let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
//                            let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//                           
//                                self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\("+91")\(removedPunctuation)", imgData: contact.thumbnailImageData))
//                            print(self.peopleList,"picker contacts one")
//                            self.listTV.reloadData()
//                        }))
//                    }
//                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
//                        debugPrint("User click Cancel button")
//                    }))
//                    self.present(alert, animated: true, completion: {
//                        debugPrint("completion block")
//                        self.listTV.reloadData()
//                    })
//                }
//                else if contactForPeople == false && phoneVal >= 2 {
//                    self.dismiss(animated: true, completion: nil)
//                    let alert = UIAlertController(title: "Please choose any one of the numbers", message: nil, preferredStyle: .actionSheet)
//                    for a in 1...phoneVal {
//                        alert.addAction(UIAlertAction(title: "\(phoneArr[a-1].value.stringValue)", style: .default, handler:{ (UIAlertAction)in
//                            let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
//                            let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
//                            let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
////                            self.testLb.text = removedPunctuation
//                            print(removedPunctuation)
//
//                            self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\("+91")\(removedPunctuation)", imgData: contact.thumbnailImageData))
//                            print(self.peopleList,"picker contacts two")
//                            for namesD in self.peopleList {
//                                print(namesD.Name)
//                                print(namesD.Phone)
//                            }
//                            self.listTV.reloadData()
//                        }))
//                    }
//                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
//                        debugPrint("User click Cancel button")
//                    }))
//                    self.present(alert, animated: true, completion: {
//                        debugPrint("completion block")
//                        self.listTV.reloadData()
//                    })
//                }
//
////                for number in contact.phoneNumbers {
////                    let phoneNumber = number.value
////
////                    contactD.append(phoneNumber.stringValue)
////
////                    print(contactD)
////                }
//            
//            }
//    }
//    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
//        print("Cancel Contact Picker")
//    }
//    
////    lazy var contacts: [CNContact] =
////       {
////           let contactStore = CNContactStore()
////           let keysToFetch = [
////               CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
////               CNContactEmailAddressesKey,
////               CNContactPhoneNumbersKey] as [Any]
////
////           // Get all the containers
////           var allContainers: [CNContainer] = []
////           do
////           {
////               allContainers = try contactStore.containers(matching: nil)
////           }
////           catch
////           {
////               print("Error fetching containers")
////           }
////
////           var results: [CNContact] = []
////
////          // Iterate all containers and append their contacts to our results array
////           for container in allContainers
////           {
////               let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
////
////               do
////               {
////                   let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
////                   results.append(contentsOf: containerResults)
////               }
////               catch
////               {
////                   print("Error fetching results for container")
////               }
////           }
////
////       return results
////       }()
//
//   
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
////
////
////
////    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
////        if chosenContactType == ContactType.Email.rawValue {
////            var emailVal = 0
////            let emailsArr = contact.emailAddresses
////            let email = emailsArr.first?.value ?? ""
////            for _ in emailsArr {
////                emailVal += 1
////            }
////            if emailVal == 0 {
////                print("There is no email in this contact \(contact.givenName) \(contact.familyName)")
////            }
////            else if contactForPeople == true && emailVal == 1 {
//////                textFieldInvitePeople.text = "\(email)"
//////                viewModel.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(email)", Phone: nil, imgData: contact.thumbnailImageData))
////
////            }
////            else if contactForPeople == false && emailVal == 1 {
//////                textFieldPhotographer.text = "\(email)"
//////                viewModel.photographerList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(email)", Phone: nil, imgData: contact.thumbnailImageData))
////                }
////            else if contactForPeople == true && emailVal >= 2 {
////                self.dismiss(animated: true, completion: nil)
////                let alert = UIAlertController(title: "Please choose any one of the emails", message: nil, preferredStyle: .actionSheet)
////                for a in 1...emailVal {
////                    alert.addAction(UIAlertAction(title: "\(emailsArr[a-1].value)", style: .default, handler:{ (UIAlertAction) in
//////                        self.textFieldInvitePeople.text = "\(emailsArr[a-1].value)"
//////                        self.viewModel.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(emailsArr[a-1].value)", Phone: nil, imgData: contact.thumbnailImageData))
////                         }))
////                }
////                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
////                    debugPrint("User click Cancel button")
////                }))
////                self.present(alert, animated: true, completion: {
////                    debugPrint("completion block")
////                })
////            }
////            else if contactForPeople == false && emailVal >= 2 {
////                self.dismiss(animated: true, completion: nil)
////                let alert = UIAlertController(title: "Please choose any one of the emails", message: nil, preferredStyle: .actionSheet)
////                for a in 1...emailVal {
////                    alert.addAction(UIAlertAction(title: "\(emailsArr[a-1].value)", style: .default, handler:{ (UIAlertAction)in
//////                        self.textFieldPhotographer.text = "\(emailsArr[a-1].value)"
//////                        self.viewModel.photographerList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(emailsArr[a-1].value)", Phone: nil, imgData: contact.thumbnailImageData))
//////                        self.btnAddPhotograher.isUserInteractionEnabled = true
//////                        self.btnAddPhotograher.backgroundColor = UIColor(red: 0.53, green: 0.25, blue: 0.93, alpha: 1.00)
////                    }))
////                }
////                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
////                    debugPrint("User click Cancel button")
////                }))
////                self.present(alert, animated: true, completion: {
////                    debugPrint("completion block")
////                })
////            }
////        }else{
////            var phoneVal = 0
////            let phoneArr = contact.phoneNumbers
////            let removedSpaces = phoneArr.first?.value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
////            let removedSymbols = removedSpaces?.components(separatedBy: CharacterSet.symbols).joined(separator: "")
////            let removedPunctuation = removedSymbols?.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
////            let phone = removedPunctuation
//////            let countryCodePeople = txtFieldInvitePeopleCountry.text?.components(separatedBy: " ")
//////            let countryCodePhotographer = txtFieldPhotographerCountry.text?.components(separatedBy: " ")
////            for _ in phoneArr {
////                phoneVal += 1
////            }
////            if phoneVal == 0 {
//////                showToast(message: "There is no number in this contact \(contact.givenName) \(contact.familyName)")
////            }
////            else if contactForPeople == true && phoneVal == 1 {
//////                txtFieldInvitePeoplePhone.text = "\(phone ?? "")"
//////                viewModel.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\(countryCodePeople?[1] ?? "")\(phone ?? "")", imgData: contact.thumbnailImageData))
//////                btnAddPhone.isUserInteractionEnabled = true
//////                btnAddPhone.backgroundColor = UIColor(red: 0.53, green: 0.25, blue: 0.93, alpha: 1.00)
////            }
////            else if contactForPeople == false && phoneVal == 1 {
//////                txtFieldPhotographerPhone.text = "\(phone ?? "")"
//////                viewModel.photographerList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\(countryCodePhotographer?[1] ?? "")\(phone ?? "")", imgData: contact.thumbnailImageData))
////            }
////            else if contactForPeople == true && phoneVal >= 2 {
////                self.dismiss(animated: true, completion: nil)
////                let alert = UIAlertController(title: "Please choose any one of the numbers", message: nil, preferredStyle: .actionSheet)
////                for a in 1...phoneVal {
////                    alert.addAction(UIAlertAction(title: "\(phoneArr[a-1].value.stringValue)", style: .default, handler:{ (UIAlertAction) in
////                        let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
////                        let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
////                        let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//////                        self.txtFieldInvitePeoplePhone.text = removedPunctuation
//////                        self.viewModel.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\(countryCodePeople?[1] ?? "")\(removedPunctuation)", imgData: contact.thumbnailImageData))
//////                        self.btnAddPhone.isUserInteractionEnabled = true
//////                        self.btnAddPhone.backgroundColor = UIColor(red: 0.53, green: 0.25, blue: 0.93, alpha: 1.00)
////                    }))
////                }
////                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
////                    debugPrint("User click Cancel button")
////                }))
////                self.present(alert, animated: true, completion: {
////                    debugPrint("completion block")
////                })
////            }
////            else if contactForPeople == false && phoneVal >= 2 {
////                self.dismiss(animated: true, completion: nil)
////                let alert = UIAlertController(title: "Please choose any one of the numbers", message: nil, preferredStyle: .actionSheet)
////                for a in 1...phoneVal {
////                    alert.addAction(UIAlertAction(title: "\(phoneArr[a-1].value.stringValue)", style: .default, handler:{ (UIAlertAction)in
////                        let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
////                        let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
////                        let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//////                        self.txtFieldPhotographerPhone.text = removedPunctuation
//////                        self.viewModel.photographerList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\(countryCodePhotographer?[1] ?? "")\(removedPunctuation)", imgData: contact.thumbnailImageData))
////                    }))
////                }
////                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
////                    debugPrint("User click Cancel button")
////                }))
////                self.present(alert, animated: true, completion: {
////                    debugPrint("completion block")
////                })
////            }
////        }
////    }
////    shouldChangeCharactersIn : delegate
//    
////    if textField == txtFieldInvitePeoplePhone {
////        let currentString: NSString = (textField.text ?? "") as NSString
////        let newString: NSString =
////        currentString.replacingCharacters(in: range, with: string) as NSString
////        var returnValue = false
////                    if newString.length == mobilePeopleNumLength {
////                        chosenPhoneCount = mobilePeopleNumLength
////                    }
////                    if newString.length <= chosenPhoneCount {
////                       returnValue = true
////                    }else if newString.length <= mobilePeopleNumLength{
////                        returnValue = true
////                    }else{
////                        returnValue = false
////                    }
////                    return returnValue
////        return newString.length <= mobilePeopleNumLength
////    } :- what happen ??.....
//    
//    
//    
//    
//}
//
//extension ContactsViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.peopleList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = listTV.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
//        cell.contactNameLabel.text = self.peopleList[indexPath.row].Name
//        return cell
//    }
//    
//    
//}



// MARK:  two
//
//  ContactsViewController.swift
//  TaskApp
//
//  Created by CV on 4/13/22.
//
//
//import UIKit
//import Contacts
//import ContactsUI
//import Foundation
//
//
//struct ContactDetails {
//    var Name: String?
//    var Email: String?
//    var Phone: String?
//    var imgData: Data?
//}
//enum ContactType : String {
//    case Email = "email"
//    case Phone = "phone"
//}
//class UserDefaultsManager {
//    
//    static let shared: UserDefaultsManager = {
//        let instance = UserDefaultsManager()
//        return instance
//    }()
//    
//    var phoneNumber: String {
//        get {
//            return UserDefaults.standard.string(forKey: UserDefaultsKey.PHONE) ?? ""
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.PHONE)
//        }
//    }
//}
//struct UserDefaultsKey {
//    static let PHONE = "phone"
//    
//}
//class ContactsViewController: UIViewController,CNContactPickerDelegate {
//    @IBOutlet weak var testLb: UILabel!
//    var contactForPeople:Bool = false
//    var chosenContactType : String = ""
//    var contactType : String = ""
//    var contactD = [String]()
//    var peopleList = [ContactDetails]()
//    var chosenPhoneCount = 0
//    let contactStore = CNContactStore()
//    var contacts = [CNContact]()
//    @IBOutlet weak var listTV: UITableView!
//    
//    
//    @IBOutlet weak var mobileNumberTF: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        listTV.delegate = self
//        listTV.dataSource = self
//        listTV.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
//        
//        
//     
//        
//        
//        UINavigationBar.appearance().barStyle = .black
//        UINavigationBar.appearance().barTintColor = .gray
//        UINavigationBar.appearance().tintColor = .red
//        UINavigationBar.appearance().isOpaque = true
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
//        
//    }
//    @IBAction func click_Contact(_ sender: UIButton) {
//        
//        //        if let url = URL(string: "tel://\(UserDefaultsManager.shared.phoneNumber )"), UIApplication.shared.canOpenURL(url) {
//        //            if #available(iOS 10, *) {
//        //                UIApplication.shared.open(url)
//        //            } else {
//        //                UIApplication.shared.openURL(url)
//        //            }
//        //        }
//        
//        //        let vc = CNContactPickerViewController()
//        //        vc.delegate = self
//        //        self.present(vc, animated: true)
//        let alertController = UIAlertController(title: "Alert title", message: "Message to display", preferredStyle: .alert)
//        // Create OK button
//        let OKAction = UIAlertAction(title: "phone", style: .default) {
//            (action: UIAlertAction!) in
//            sender.tag == 0
//            self.contactType = ContactType.Email.rawValue
//            let cnPicker = CNContactPickerViewController()
//            cnPicker.delegate = self
//            self.present(cnPicker, animated: true, completion: nil)
//        }
//        
//        alertController.addAction(OKAction)
//        // Create Cancel button
//        let cancelAction = UIAlertAction(title: "email", style: .default) {
//            (action: UIAlertAction!) in
//            sender.tag == 1
//            self.contactType = ContactType.Phone.rawValue
//            let cnPicker = CNContactPickerViewController()
//            cnPicker.delegate = self
//            self.present(cnPicker, animated: true, completion: nil)
//        }
//        alertController.addAction(cancelAction)
//        // Present Dialog message
//        self.present(alertController, animated: true, completion: nil)
//        
//    }
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
//        
//        contacts.forEach { contact in
//            if chosenContactType == ContactType.Email.rawValue {
//                var emailVal = 0
//                let emailsArr = contact.emailAddresses
//                let email = emailsArr.first?.value ?? ""
//                for _ in emailsArr {
//                    emailVal += 1
//                }
//                if emailVal == 0 {
//                    
//                }
//                else if contactForPeople == true && emailVal == 1 {
//                    
//                    self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(email)", Phone: nil, imgData: contact.thumbnailImageData))
//                    self.listTV.reloadData()
//                }
//                else if contactForPeople == false && emailVal == 1 {
//                    self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(email)", Phone: nil, imgData: contact.thumbnailImageData))
//                    self.listTV.reloadData()
//                }
//                else if contactForPeople == true && emailVal >= 2 {
//                    for a in 1...emailVal {
//                        self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(emailsArr[a-1].value)", Phone: nil, imgData: contact.thumbnailImageData))
//                        self.listTV.reloadData()
//                    }
//                }
//                else if contactForPeople == false && emailVal >= 2 {
//                    for a in 1...emailVal {
//                        self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "\(emailsArr[a-1].value)", Phone: nil, imgData: contact.thumbnailImageData))
//                        self.listTV.reloadData()
//                    }
//                }
//            }else{
//                var phoneVal = 0
//                let phoneArr = contact.phoneNumbers
//                let removedSpaces = phoneArr.first?.value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
//                let removedSymbols = removedSpaces?.components(separatedBy: CharacterSet.symbols).joined(separator: "")
//                let removedPunctuation = removedSymbols?.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//                let phone = removedPunctuation
//                for _ in phoneArr {
//                    phoneVal += 1
//                }
//                if phoneVal == 0 {
//                    
//                }
//                else if contactForPeople == true && phoneVal >= 2 {
//                    for a in 1...phoneVal {
//                        let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
//                        let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
//                        let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//                        
//                        self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\(removedPunctuation)", imgData: contact.thumbnailImageData))
//                        self.listTV.reloadData()
//                    }
//                }
//                else if contactForPeople == false && phoneVal >= 2 {
//                    for a in 1...phoneVal {
//                        let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
//                        let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
//                        let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//                        //                            self.testLb.text = removedPunctuation
//                        print(removedPunctuation)
//                        
//                        self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\("+91")\(removedPunctuation)", imgData: contact.thumbnailImageData))
//                        //                    for namesD in self.peopleList {
//                        //                        print(namesD.Name)
//                        //                        print(namesD.Phone)
//                        //                    }
//                        self.listTV.reloadData()
//                    }
//                }
//            }
//        }
//    }
//    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
//        print("Cancel Contact Picker")
//    }
//}
//
//extension ContactsViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.peopleList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = listTV.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
//        cell.contactNameLabel.text = self.peopleList[indexPath.row].Name
//        return cell
//    }
//    
//    
//}
//


//MARK: new
//import Foundation
//import ContactsUI

//enum ContactsFilter {
//    case none
//    case mail
//    case message
//}
//
//struct PhoneContact {
//    var givenName: String
//    var middleName: String
//    var familyName: String
//    var number: String
//    var numberLabel: String
//
//    var fullName: String {
//        return "\(givenName)\(middleName.isEmpty ? "" : " \(middleName)")\(familyName.isEmpty ? "" : " \(familyName)")"
//    }
//
//    var numberFormatted: String {
//        do {
//            return try PhoneNumberManager.validate(number, with: .e164)
//        } catch {
//            return ""
//        }
//    }
//
//    var json: [String: String] {
//        return ["mobileNumber": numberFormatted, "contactName": fullName]
//    }
//}
//
//class ContactsManager {
//
//    //MARK: - Properties
//
//    static let manager = ContactsManager()
//
//    //MARK: - Helpers
//
//    private func getContacts(from contactStore: CNContactStore, filter: ContactsFilter = .none) -> [CNContact] {
//
//        var results: [CNContact] = []
//
//        let keysToFetch = [
//            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
//            CNContactPhoneNumbersKey] as [Any]
//
//        var allContainers: [CNContainer] = []
//        do {
//            allContainers = try contactStore.containers(matching: nil)
//        } catch {
//            return results
//        }
//
//        for container in allContainers {
//            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
//
//            do {
//                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
//                results.append(contentsOf: containerResults)
//            } catch {
//                return results
//            }
//        }
//
//        return results
//    }
//
//
//    private func contactsAuthorization(for store: CNContactStore, completionHandler: @escaping ((_ isAuthorized: Bool) -> Void)) {
//        let authorizationStatus = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
//
//        switch authorizationStatus {
//        case .authorized:
//            completionHandler(true)
//        case .notDetermined:
//            store.requestAccess(for: CNEntityType.contacts, completionHandler: { (isAuthorized: Bool, error: Error?) in
//                completionHandler(isAuthorized)
//            })
//        case .denied:
//            completionHandler(false)
//        case .restricted:
//            completionHandler(false)
//        }
//    }
//
//    private func parse(_ contact: CNContact) -> PhoneContact? {
//
//        for phoneNumber in contact.phoneNumbers {
//            if let label = phoneNumber.label {
//                let number = phoneNumber.value
//                let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
//                return PhoneContact(givenName: contact.givenName, middleName: contact.middleName, familyName: contact.familyName, number: number.stringValue, numberLabel: localizedLabel)
//            }
//
//        }
//
//        return nil
//    }
//
//    //MARK: - Actions
//
//    func fetchAllContacts(completionHandler: @escaping (([PhoneContact], Error?) -> Void)) {
//
//        var phoneContacts = [PhoneContact]()
//
//        let contactStore = CNContactStore()
//
//        contactsAuthorization(for: contactStore) { isAuthorized in
//            if isAuthorized {
//                let contacts = self.getContacts(from: contactStore)
//                for contact in contacts {
//                    if let phoneContact = self.parse(contact) {
//                        if phoneContact.givenName != "SPAM" && phoneContact.numberFormatted != "" {
//                            phoneContacts.append(phoneContact)
//                        }
//                    } else {
//                        continue
//                    }
//                }
//                completionHandler(phoneContacts, nil)
//            } else {
//                completionHandler(phoneContacts, MCError.NotAuthorized)
//            }
//        }
//    }
//}
