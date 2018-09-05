//
//  PassangerDetailsVCCell.swift
//  Book Ticket
//
//  Created by APPLE on 30/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

class PassangerDetailsVCCell: UITableViewCell {
    
    //-------------------
    //MARK: IBOutlets an Variables
    //-------------------
    
    var counts: Int = 0
    
    @IBOutlet weak var rowCount: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        nameTextField.setBottomBorder(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        ageTextField.setBottomBorder(color: #colorLiteral(red: 0.8862745098, green: 0.862745098, blue: 0.8196078431, alpha: 1))
    }

}
