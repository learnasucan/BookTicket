//
//  Utilities.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 28/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData

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
    
    // MARK: Alert without Button Action
    //----------------------------------------
    
    class func alertWithoutButtonAction(alertTitle : String, alertMessage message: String, messageOnButton buttonText: String, passViewController VC: UIViewController)
    {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertActionStyle.default, handler: nil))
        VC.present(alert, animated: true, completion: nil)
    }
    
    //  Get Context for core data
    
    class func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    /*
     class func presentToolBarPicker(for done:@escaping () -> (), to cancel:String){
     //ToolBar
     
     let toolBar : UIToolbar = {
     let toolbar = UIToolbar();
     toolbar.sizeToFit()
     
     let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done));
     let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
     let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
     
     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
     
     return toolbar
     } ()
     }
     
     */
    
    //MARK: Name Validation
    
    class func nameValidation (textField:UITextField , view: UIViewController) {
        let name_reg = "[A-Za-z0-9]{5,20}"
        
        let name_test = NSPredicate(format: "SELF MATCHES %@", name_reg)
        
        if name_test.evaluate(with: textField.text) == false
        {
            let alert = UIAlertController(title: "Information", message: "Enter the name in range from 5 to 20", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: PICODE Validation
    
    class func pinCodeValidation(textField:UITextField , view: UIViewController) {
        let pin_reg = "[0-9]{6}"
        
        let pin_test = NSPredicate(format: "SELF MATCHES %@", pin_reg)
        
        if pin_test.evaluate(with: textField.text) == false
        {
            let alert = UIAlertController(title: "Information", message: "Enter 6 digit pincode", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: Mobile Validation
    
    class func mobileValidation (textField:UITextField , view: UIViewController) {
        let mobile_reg = "[0-9]{10}"
        
        let mobile_test = NSPredicate(format: "SELF MATCHES %@", mobile_reg)
        
        if mobile_test.evaluate(with: textField.text) == false
        {
            let alert = UIAlertController(title: "Information", message: "Enter your number in correct format", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: Email Validation
    
    class func emailValidation (textField:UITextField , view: UIViewController) {
        
        let email_reg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let email_test = NSPredicate(format: "SELF MATCHES %@", email_reg)
        
        if email_test.evaluate(with: textField.text) == false
        {
            let alert = UIAlertController(title: "Information", message: "Please enter valid email id.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            view.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: Empty Field
    
    class func emptyFieldValidate (textField:UITextField , view: UIViewController) {
        
        guard let theText = textField.text, !theText.isEmpty else {
            // theText is empty
            alertWithoutButtonAction(alertTitle: "Alert", alertMessage: "Please Enter Somethimg", messageOnButton: "Ok", passViewController: view)
            return // or throw
        }
        
        
    }
    
    //generate random alpha numberic string
    class func randomAlphaNumericString(length: Int = 10) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
        
        //let randomString = String.randomAlphaNumericString()
    }
    
    
    

    
    
    
    
    
    
    
    //
}

//MARK:UserDefaults
enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
    case userName = "name"
    case userEmail = "email"
    case userMobile = "mobile"
    case userAddress = "address"
    case userPin = "pincode"
}




extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    
    func setUserName(value: String){
        set(value, forKey: UserDefaultsKeys.userName.rawValue)
        //synchronize()
    }
    
    func setUserEmail(value: String){
        set(value, forKey: UserDefaultsKeys.userEmail.rawValue)
        //synchronize()
    }
    
    func setUserMobile(value: String){
        set(value, forKey: UserDefaultsKeys.userMobile.rawValue)
        //synchronize()
    }
    
    func setUserAdd(value: String){
        set(value, forKey: UserDefaultsKeys.userAddress.rawValue)
        //synchronize()
    }
    
    func setUserPin(value: String){
        set(value, forKey: UserDefaultsKeys.userPin.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
    
    func getUserName() -> String{
        return UserDefaultsKeys.userName.rawValue
    }
    
    func getUserEmail() -> String{
        return UserDefaultsKeys.userEmail.rawValue
    }
    
    func getUserMobile() -> String{
        return UserDefaultsKeys.userMobile.rawValue
    }
    
    func getUserAdd() -> String{
        return UserDefaultsKeys.userAddress.rawValue
    }
    
    func getUserPin() -> String{
        return UserDefaultsKeys.userPin.rawValue
    }
    
    
    
}

extension Date{
    
    func getDateString() -> String {
        return self.getDateString(withFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
    
    func getDateString(withFormat format:String) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
        
    }
    
}

// message.created_at = Date().getDateString()
