 

import UIKit
import Contacts
import ContactsUI
import Foundation

struct FetchedContact {
    var firstName: String
    var lastName: String
    var telephone: String
}

struct ContactDetails {
    var Name: String?
    var Email: String?
    var Phone: String?
    var imgData: Data?
}
enum ContactType : String {
    case Email = "email"
    case Phone = "phone"
}
class UserDefaultsManager {

    static let shared: UserDefaultsManager = {
        let instance = UserDefaultsManager()
        return instance
    }()

    var phoneNumber: String {
            get {
             return UserDefaults.standard.string(forKey: UserDefaultsKey.PHONE) ?? ""
            }
            set {
                UserDefaults.standard.set(newValue, forKey: UserDefaultsKey.PHONE)
            }
        }
}
struct UserDefaultsKey {
    static let PHONE = "phone"

}
class ContactsViewController: UIViewController,CNContactPickerDelegate {
    @IBOutlet weak var testLb: UILabel!
    var contactForPeople:Bool = false
    var chosenContactType : String = ""
    var contactType : String = ""
    var contactD = [String]()
    var peopleList = [ContactDetails]()
    var chosenPhoneCount = 0
    var contacts = [FetchedContact]()
    
  
    
    @IBOutlet weak var listTV: UITableView!


    @IBOutlet weak var mobileNumberTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchContacts()
        listTV.delegate = self
        listTV.dataSource = self
        listTV.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")

    }
    private func fetchContacts() {
        // 1.
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                // 2.
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    // 3.
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        self.contacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
                    })
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }
    @IBAction func click_Contact(_ sender: UIButton) {

        let alertController = UIAlertController(title: "Alert title", message: "Message to display", preferredStyle: .alert)
        // Create OK button
        let OKAction = UIAlertAction(title: "phone", style: .default) {
            (action: UIAlertAction!) in
            sender.tag == 0
            self.contactType = ContactType.Email.rawValue
            let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        }

        alertController.addAction(OKAction)
        // Create Cancel button
        let cancelAction = UIAlertAction(title: "email", style: .default) {
            (action: UIAlertAction!) in
            sender.tag == 1
            self.contactType = ContactType.Phone.rawValue
            let cnPicker = CNContactPickerViewController()
            cnPicker.delegate = self
            self.present(cnPicker, animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        // Present Dialog message
        self.present(alertController, animated: true, completion: nil)

    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            let countryCodePeople = "+91"
//            txtFieldInvitePeopleCountry.text?.components(separatedBy: " ")
                var phoneVal = 0
                let phoneArr = contact.phoneNumbers
                let removedSpaces = phoneArr.first?.value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
                let removedSymbols = removedSpaces?.components(separatedBy: CharacterSet.symbols).joined(separator: "")
                let removedPunctuation = removedSymbols?.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
                let phone = removedPunctuation
                for _ in phoneArr {
                    phoneVal += 1
                }
                if phoneVal == 0 {

                }
                else if contactForPeople == false && phoneVal == 1 {

                    let contactList = [phone ?? ""]

                    for contactLists in contactList {
//                          print(contactLists)
                        testLb.text = contactLists
                        self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: "", Phone: contactLists, imgData: contact.thumbnailImageData))
                    }
                }
                else if contactForPeople == true && phoneVal >= 2 {
                    self.dismiss(animated: true, completion: nil)
                    let alert = UIAlertController(title: "Please choose any one of the numbers", message: nil, preferredStyle: .actionSheet)
                    for a in 1...phoneVal {
                        alert.addAction(UIAlertAction(title: "\(phoneArr[a-1].value.stringValue)", style: .default, handler:{ (UIAlertAction) in
                            let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
                            let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
                            let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")

                                self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\("+91")\(removedPunctuation)", imgData: contact.thumbnailImageData))
                            print(self.peopleList,"picker contacts one")
                            self.listTV.reloadData()
                        }))
                    }
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
                        debugPrint("User click Cancel button")
                    }))
                    self.present(alert, animated: true, completion: {
                        debugPrint("completion block")
                        self.listTV.reloadData()
                    })
                }
                else if contactForPeople == false && phoneVal >= 2 {
                    self.dismiss(animated: true, completion: nil)
                    let alert = UIAlertController(title: "Please choose any one of the numbers", message: nil, preferredStyle: .actionSheet)
                    for a in 1...phoneVal {
                        alert.addAction(UIAlertAction(title: "\(phoneArr[a-1].value.stringValue)", style: .default, handler:{ (UIAlertAction)in
                            let removedSpaces = phoneArr[a-1].value.stringValue.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined(separator: "")
                            let removedSymbols = removedSpaces.components(separatedBy: CharacterSet.symbols).joined(separator: "")
                            let removedPunctuation = removedSymbols.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
//                            self.testLb.text = removedPunctuation
                            print(removedPunctuation)

                            self.peopleList.append(ContactDetails.init(Name: "\(contact.givenName) \(contact.familyName)", Email: nil, Phone: "\("+91")\(removedPunctuation)", imgData: contact.thumbnailImageData))
                            print(self.peopleList,"picker contacts two")
                            for namesD in self.peopleList {
                                print(namesD.Name)
                                print(namesD.Phone)
                            }
                            self.listTV.reloadData()
                        }))
                    }
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
                        debugPrint("User click Cancel button")
                    }))
                    self.present(alert, animated: true, completion: {
                        debugPrint("completion block")
                        self.listTV.reloadData()
                    })
                }
            }
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
    }


}

extension ContactsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.peopleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTV.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        let test = self.peopleList[indexPath.row]
        cell.contactNameLabel.text = test.Name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.peopleList[indexPath.row].Name?.lowercased().range(of: peopleList[indexPath.row].Name ?? ""))
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
