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
    
    //  Get Context for core data
    
    class func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
}

//MARK:UserDefaults
enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
    case userName
    case userEmail
    case userMobile
    case userAddress
    case userPin
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
