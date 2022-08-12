//
//  MultipleSelectViewController.swift
//  TaskApp
//
//  Created by CV on 5/31/22.
//

import UIKit
import PhoneNumberKit
import Foundation

// MARK: - CountryCodeElement
struct CountryCodeElement: Codable {
    let name, flag, code, dialCode: String

    enum CodingKeys: String, CodingKey {
        case name, flag, code
        case dialCode = "dial_code"
    }
}
typealias CountryCode = [CountryCodeElement]
class MultipleSelectViewController: UIViewController {
    let phoneNumberKit = PhoneNumberKit()
    var mobilePeopleNumLength : Int = 10
    var mobilePhotographerNumLength : Int = 10
    var deviceCountryCode : String = ""
    @IBOutlet weak var numberenterTF: UITextField!
    @IBOutlet weak var multipleSelectTV: UITableView!
   // This is selected cell data array
    @IBOutlet weak var collectionViewd:UICollectionView!
    var arrData = ["One","One","One","One"]// This is your data array
    var arrSelectedIndex = [IndexPath]() // This is selected cell Index array
    var arrSelectedData = [String]()
    var selectedIdx = Dictionary<Int,Int>()
    var dataSource:[String] = ["One","One","One","One"]
    var nameEnter = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        multipleSelectTV.delegate = self
        multipleSelectTV.dataSource = self
        multipleSelectTV.register(UINib(nibName: "MultipleSelectCell", bundle: nil), forCellReuseIdentifier: "MultipleSelectCell")
        collectionViewd.delegate = self
        collectionViewd.dataSource = self
        collectionViewd.register(UINib(nibName: "CCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CCollectionViewCell")
        // Do any additional setup after loading the view.
        let rawNumberArray = ["0291 12345678", "291 12345678", "04134 1234", "09123 12345"]
        let phoneNumbers = phoneNumberKit.parse(rawNumberArray)
//        let phoneNumbersCustomDefaultRegion = phoneNumberKit.parse(rawNumberArray, withRegion: "DE",  ignoreType: true)
//        print(phoneNumbersCustomDefaultRegion,"phoneNumbersCustomDefaultRegion")
        print(phoneNumbers,"phoneNumbers")
        
    }
    @IBAction func click(_ sender: Any) {
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
extension MultipleSelectViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = multipleSelectTV.dequeueReusableCell(withIdentifier: "MultipleSelectCell",for: indexPath) as! MultipleSelectCell
//        cell.chekImg.image = UIImage(named: (selectedCells.contains( indexPath.row)) ?  "CheckMark" : "UnCheckMark")
        if selectedIdx[indexPath.row] != nil{
            cell.cellConfigration(title: self.dataSource[indexPath.row], isSelected: true)
//            cell.heightConstraint.constant = 50
            
            cell.actionForTextField = { text in
                switch indexPath.row{
                case 0:
                    self.nameEnter = text
                default:
                    break
                }
            }
        }else{
            cell.cellConfigration(title: self.dataSource[indexPath.row], isSelected: false)
//            cell.heightConstraint.constant = 100
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedIdx[indexPath.row] != nil{
            return 200
        }else{
            return 50
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIdx[indexPath.row] != nil{
            self.selectedIdx.removeValue(forKey: indexPath.row)
           
        }else{
           
            selectedIdx[indexPath.row] = indexPath.row
           
        }
        tableView.reloadData()
    }
}
extension MultipleSelectViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionViewd.dequeueReusableCell(withReuseIdentifier: "CCollectionViewCell", for: indexPath) as! CCollectionViewCell

        if arrSelectedIndex.contains(indexPath) { // You need to check wether selected index array contain current index if yes then change the color
            cell.vw.backgroundColor = UIColor.red
        }
        else {
            cell.vw.backgroundColor = UIColor.lightGray
        }

        cell.layoutSubviews()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")

        let strData = arrData[indexPath.item]

        if arrSelectedIndex.contains(indexPath) {
            arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
            arrSelectedData = arrSelectedData.filter { $0 != strData}
        }
        else {
            arrSelectedIndex.append(indexPath)
            arrSelectedData.append(strData)
        }

        collectionView.reloadData()
    }
}
