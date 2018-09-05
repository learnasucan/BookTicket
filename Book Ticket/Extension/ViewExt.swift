//
//  ViewExt.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 04/09/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

public enum UIViewBorderSide {
    case top, bottom, left, right
}

extension UIView {
    func makeScreenshot() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
            return renderer.image { (context) in
                self.layer.render(in: context.cgContext)
            }
        } else {
            return UIImage()
        }
        
    }
    
    public func addBorder(side: UIViewBorderSide, color: UIColor, width: CGFloat, height :CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: height)
        case .bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: height)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
    }
}
