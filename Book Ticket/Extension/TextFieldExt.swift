//
//  TextFieldExt.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 04/09/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder(color : CGColor) {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func setBottomBorder(color: CGColor, textField: UITextField)
    {
        self.borderStyle = UITextBorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color
        border.frame = CGRect(x: 0, y: textField.frame.height - width,   width:  textField.frame.width, height: textField.frame.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
