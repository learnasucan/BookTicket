//
//  Utilities.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 28/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    /** Get Current Date in String **/
    class func getCurrentTimeStamp() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let result = formatter.string(from: date)
        return result
    }
    
    /** Convert Date to Date String **/
    class func getDateFromStringDate(stringDate: String, dateFormatOutput: DateFormatter) -> Date {
        let date = dateFormatOutput.date(from: stringDate)
        return date!
    }
    
    // MARK: Validate email id
    //----------------------------
    
    class func validationFunction(email_Id : String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email_Id)
    }
    
    // MARK: Validate PAN Card No
    //----------------------------
    
    class func validationFunction(panNo : String) -> Bool
    {
        let panRegEx = "[A-Z]{3}P[A-Z]{1}[0-9]{4}[A-Z]{1}"
        let panTest = NSPredicate(format:"SELF MATCHES %@", panRegEx)
        return panTest.evaluate(with: panNo)
    }
    
    
    // MARK: Alert
    //----------------------------
    
    class func showAlertWithCancel(alertTitle: String, alertMessage msg: String,cancelTitle : String,requiredActionTitle : String, passViewController VC: UIViewController, completion: @escaping (_ success: Bool) -> Void) {
        let alertController = UIAlertController(title: alertTitle, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { UIAlertAction in
            completion(false)
        }))
        alertController.addAction(UIAlertAction(title: requiredActionTitle, style: .destructive, handler: { UIAlertAction in
            completion(true)
        }))
        VC.present(alertController, animated: true)
    }

}
