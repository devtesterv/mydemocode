//
//  ContactCell.swift
//  TaskApp
//
//  Created by CV on 5/24/22.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    
    @IBOutlet weak var checkImgview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
