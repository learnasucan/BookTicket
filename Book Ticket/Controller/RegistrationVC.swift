//
//  RegistrationVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 27/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData

class RegistrationVC: UIViewController {
    
    //------------------------------------
    //MARK: IBOutlets and variables
    //------------------------------------
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    var customers = [NSManagedObject] ()
    
    //------------------------------------
    //MARK: Button Actions
    //------------------------------------
    
    @IBAction func tapOnButton(_ sender: UIButton) {
        
        let parameters : [String: Any] = ["name": nameTextField.text!,
                                          "address": addressTextField.text!,
                                          "pincode" : pincodeTextField.text!,
                                          "mobile" : mobileTextField.text!,
                                          "email": emailTextField.text!,
                                          "password":passwordTextField.text!]

        
        let dict:RegistrationModel = parameters.toModel()
        print(dict)
        
            
        storeData(parameter: parameters)
    }
    
    @IBAction func tapOnSignIn(_ sender: UIButton) {
         performSegue(withIdentifier: "LoginVC", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TextField Validation
        emailTextField.delegate = self
        nameTextField.delegate = self
        mobileTextField.delegate = self
        passwordTextField.delegate = self
        pincodeTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        //CoreData Access
        //getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        getData()
    }
    
    //------------------------------------
    //MARK: Core Data Functions
    //------------------------------------
    

    // Save the Data
    func storeData (parameter: [String : Any]) {
        let context = Utilities.getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Customer", in: context)
        
        let customer = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        customer.setValue(parameter["name"], forKey: "name")
        customer.setValue(parameter["address"], forKey: "address")
        customer.setValue(parameter["pincode"], forKey: "pincode")
        customer.setValue(parameter["mobile"], forKey: "mobile")
        customer.setValue(parameter["email"], forKey: "email")
        customer.setValue(parameter["password"], forKey: "password")
        
        //save the object
        do {
            try context.save()
            print("saved!")
            customers.append(customer)
            
            //TODO: Make function
            nameTextField.text = ""
            addressTextField.text = ""
            pincodeTextField.text = ""
            mobileTextField.text = ""
            emailTextField.text = ""
            passwordTextField.text = ""
            confirmPasswordTextField.text = ""
            print(customers.count)
//            print(customers[0].value(forKey: "name") as Any)
            
            //At last move to LoginVC
            defer {
                performSegue(withIdentifier: "LoginVC", sender: self)
            }
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }

    
   
    
    
}


extension Dictionary {
    
    func toModel<T:Codable>() -> T{
        
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        
        let dict = try? JSONDecoder().decode(T.self, from: jsonData!)
        
        return dict!
        
    }
    
    
}

extension RegistrationVC : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        switch textField {
        case nameTextField:
            Utilities.nameValidation(textField: nameTextField, view: self)
            break
            
        case addressTextField:
            break
            
        case pincodeTextField:
            Utilities.pinCodeValidation(textField: pincodeTextField, view: self)
            break
            
        case mobileTextField:
            Utilities.mobileValidation(textField: mobileTextField, view: self)
            break
            
        case emailTextField:
            Utilities.emailValidation(textField: emailTextField, view: self)
            break
            
        case passwordTextField:
            break
            
        case confirmPasswordTextField:
            if confirmPasswordTextField.text! != (passwordTextField.text!) && !(passwordTextField.text?.isEmpty)! {
                let alert = UIAlertController(title: "Information", message: "Password not match", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alert.addAction(ok)
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
            }
            break
            
        default:
            print("Wrong Typed")
            break
        }
    }
    
}
