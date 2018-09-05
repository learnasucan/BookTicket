//
//  LoginVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 27/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData
let defaults = UserDefaults.standard
class LoginVC: UIViewController {
    
    
    @IBOutlet weak var usenameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func tapOnSubmit(_ sender: UIButton) {
    
        //guard let
        getData()
    }
    
    @IBAction func tapOnSignUp(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set navigation name
        self.navigationItem.title = "Login"
        
        //** If user is login then go to HomeVC
        /*
         
         if Utility.getUserIsLoggedInOrNot() {
         let storyboard = UIStoryboard(name: "HomeStoryBoard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
         self.navigationController?.pushViewController(vc, animated: true)
         }
         
         */
        
        usenameTextField.delegate = self
        passwordTextField.delegate = self
        
        //        setupAddTargetIsNotEmptyTextFields()
        // Do any additional setup after loading the view.
    }
    
    
    //Retrieve the Data
    
    func getData() {
        //create a fetch request, telling it about the entity
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        
        do {
            //go get the results
            let searchResults = try Utilities.getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for customer in searchResults as! [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                
                print("\(customer.value(forKey: "name") ?? "psp") \(customer.value(forKey: "email") ?? "psp@g.in")\(customer.value(forKey: "password") ?? "psp")")
                
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        
        do {
            let count = try Utilities.getContext().count(for: fetchRequest)
            print(count)
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        
        userFetch.fetchLimit = 1
        userFetch.predicate = NSPredicate(format: "name == %@", usenameTextField.text!)
        print(userFetch.fetchBatchSize)
        
        do {
            //go get the results
            let searchResults = try Utilities.getContext().fetch(userFetch)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            if searchResults.count != 0 {
                
                if let user = try Utilities.getContext().fetch(userFetch)[0] as? Customer {
                    
                    if user.name ==  self.usenameTextField.text && user.password == self.passwordTextField.text {
                        print("Email: \(String(describing: user.email!))")
                        //Save in UserDefaults
                        
                        
                        Utilities.setUserName(userName: user.name!)
                        Utilities.setUserEmail(userEmail: user.email!)
                        Utilities.setUserMobile(userMobile: user.mobile!)
                        Utilities.setUserIsLoggedInOrNot(flag: true)
                        
                        /*
                        UserDefaults.standard.setUserAdd(value: user.address!) // String
                        UserDefaults.standard.setUserPin(value: user.pincode!) // String
                        UserDefaults.standard.setUserMobile(value: user.mobile!) // String
                        */
                        
                        defer {
                            performSegue(withIdentifier: "HomeVC", sender: self)
                        }
                        
                    }
                    
                }
                
            } else {
                Utilities.alertWithoutButtonAction(alertTitle: "Alert", alertMessage: Message.EmptyFieldError, messageOnButton: "OK", passViewController: self)
            }
            //
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
    }
    
    
    
    
}

extension LoginVC: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        switch textField {
        case usenameTextField:
            Utilities.nameValidation(textField: usenameTextField, view: self)
            break
            
        case passwordTextField:
            Utilities.emptyFieldValidate(textField: passwordTextField, view: self)
            break
            
        default:
            print("Wrong Typed")
            break
        }
    }
    
    //    func setupAddTargetIsNotEmptyTextFields() {
    //        self.submitButton.isEnabled = false //hidden okButton
    //        usenameTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty),
    //                                   for: .editingChanged)
    //        passwordTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty),
    //                                    for: .editingChanged)
    //
    //    }
    //
    //    @objc func textFieldsIsNotEmpty(sender: UITextField) {
    //
    //        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
    //
    //        guard
    //            let name = usenameTextField.text, !name.isEmpty,
    //            let password = passwordTextField.text, !password.isEmpty
    //            else {
    //                self.submitButton.isEnabled = false
    ////                Utilities.alertWithoutButtonAction(alertTitle: "Alert", alertMessage: "Please Fill All Fields", messageOnButton: "Ok", passViewController: self)
    //                return
    //        }
    //        // enable okButton if all conditions are met
    //        submitButton.isEnabled = true
    //    }
    
    
}
