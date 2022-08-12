//
//  LoanedCell.swift
//  TaskApp
//
//  Created by CV on 8/29/21.
//

import UIKit
protocol moveDelegate {
    func  moveView(_ index: Int)
}
   
class LoanedCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    var delegate: moveDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
