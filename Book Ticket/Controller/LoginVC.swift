//
//  LoginVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 27/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var usenameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func tapOnSubmit(_ sender: UIButton) {
        
        getData()
        
        defer {
            performSegue(withIdentifier: "HomeVC", sender: self)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //Retrieve the Data
    
    func getData() {
        //create a fetch request, telling it about the entity

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        
        //        do {
        //            //go get the results
        //            let searchResults = try Utilities.getContext().fetch(fetchRequest)
        //
        //            //I like to check the size of the returned results!
        //            print ("num of results = \(searchResults.count)")
        //
        //            //You need to convert to NSManagedObject to use 'for' loops
        //            for customer in searchResults as! [NSManagedObject] {
        //                //get the Key Value pairs (although there may be a better way to do that...
        //
        //                     print("\(customer.value(forKey: "name") ?? "psp") \(customer.value(forKey: "email") ?? "psp@g.in")\(customer.value(forKey: "password") ?? "psp")")
        //
        //
        //            }
        //        } catch {
        //            print("Error with request: \(error)")
        //        }
        //
        
        do {
            let count = try Utilities.getContext().count(for: fetchRequest)
            print(count)
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        
        userFetch.fetchLimit = 1
        userFetch.predicate = NSPredicate(format: "name = %@", usenameTextField.text!)
        
        do {
            let users = try Utilities.getContext().fetch(fetchRequest)
            
            for user in users as! [Customer] {
                if user.name ==  self.usenameTextField.text && user.password == self.passwordTextField.text{
                    print("Email: \(String(describing: user.email!))")
                    //Save in UserDefaults
                    UserDefaults.standard.setLoggedIn(value: true)          // Bool
                    UserDefaults.standard.setUserName(value: user.name!) // String
                    UserDefaults.standard.setUserEmail(value: user.email!) // String
                    UserDefaults.standard.setUserAdd(value: user.address!) // String
                    UserDefaults.standard.setUserPin(value: user.pincode!) // String
                    UserDefaults.standard.setUserMobile(value: user.mobile!) // String
                    
                }
            }
            
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
