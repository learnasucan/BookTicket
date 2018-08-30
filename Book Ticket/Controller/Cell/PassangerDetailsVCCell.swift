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
    
    func details(){
       
    }

}
