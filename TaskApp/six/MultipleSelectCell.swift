//
//  MultipleSelectCell.swift
//  TaskApp
//
//  Created by CV on 5/31/22.
//

import UIKit

class MultipleSelectCell: UITableViewCell {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var chekImg: UIImageView!
    @IBOutlet weak var btnCategoryTitle : UIButton!
    
    @IBOutlet weak var textfieldView: UIView!
    @IBOutlet weak var enterFieldTV: UITextField!
    var actionForTextField : ((_ text:String)->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func cellConfigration(title:String,isSelected:Bool){
//        self.labelTitle.text = title
        
      
        self.chekImg.image = #imageLiteral(resourceName: "UnCheckMark")
        textfieldView.isHidden = true
//        self.labelTitle.textColor = UIColor(red: 0.53, green: 0.56, blue: 0.63, alpha: 1.00)
       
        if isSelected{
//            self.labelTitle.textColor = UIColor(red: 0.26, green: 0.29, blue: 0.35, alpha: 1.00)
            self.chekImg.image = #imageLiteral(resourceName: "CheckMark")
            textfieldView.isHidden = false
        }
    }
    @IBAction func textFieldDidChange(_ sender:UITextField){
        if let action = self.actionForTextField{
           action(sender.text ?? "")
            print(sender.text ?? (Any).self)
        }
    }
}
