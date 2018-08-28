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
    
    var customers = [NSManagedObjectContext] ()
    
    //------------------------------------
    //MARK: Button Actions
    //------------------------------------
    
    @IBAction func tapOnButton(_ sender: UIButton) {
        storeData(name: nameTextField.text!, address: addressTextField.text!, pincode: pincodeTextField.text!, mobile: mobileTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        nameTextField.delegate = self
        mobileTextField.delegate = self
        passwordTextField.delegate = self
        pincodeTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        getData()
    }
    
    //------------------------------------
    //MARK: Core Data Functions
    //------------------------------------
    

    // Get Context
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    // Save the Data
    func storeData (name: String, address: String, pincode: String, mobile: String,email: String,password: String) {
        let context = getContext()
        
        //retrieve the entity that we just created
        let entity =  NSEntityDescription.entity(forEntityName: "Customer", in: context)
        
        let customer = NSManagedObject(entity: entity!, insertInto: context)
        
        //set the entity values
        customer.setValue(name, forKey: "name")
        customer.setValue(address, forKey: "address")
        customer.setValue(pincode, forKey: "pincode")
        customer.setValue(mobile, forKey: "mobile")
        customer.setValue(email, forKey: "email")
        customer.setValue(password, forKey: "password")
        
        //save the object
        do {
            try context.save()
            print("saved!")
//            customers.append(customer)
            print(customers.count)
//            print(customers[0].value(forKey: "name") as Any)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }

    
    //Retrieve the Data
    
    func getData () {
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Customer> = Customer.fetchRequest()
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for customer in searchResults as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                print("\(Customer.value(forKey: "name"))")
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    
    
}

extension RegistrationVC : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        switch textField {
        case nameTextField:
            let name_reg = "[A-Za-z0-9]{5,20}"
            
            let name_test = NSPredicate(format: "SELF MATCHES %@", name_reg)
            
            if name_test.evaluate(with: nameTextField.text) == false
            {
                let alert = UIAlertController(title: "Information", message: "Enter the name in correct format", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alert.addAction(ok)
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
            }
            break
        case addressTextField:
            break
        case pincodeTextField:
            let pin_reg = "[0-9]{6}"
            
            let pin_test = NSPredicate(format: "SELF MATCHES %@", pin_reg)
            
            if pin_test.evaluate(with: pincodeTextField.text) == false
            {
                let alert = UIAlertController(title: "Information", message: "Enter 6 digit pincode", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alert.addAction(ok)
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
            }
            break
        case mobileTextField:
            let mobile_reg = "[0-9]{10}"
            
            let mobile_test = NSPredicate(format: "SELF MATCHES %@", mobile_reg)
            
            if mobile_test.evaluate(with: mobileTextField.text) == false
            {
                let alert = UIAlertController(title: "Information", message: "Enter your number in correct format", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alert.addAction(ok)
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
            }
            
            break
        case emailTextField:
            let email_reg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let email_test = NSPredicate(format: "SELF MATCHES %@", email_reg)
            
            if email_test.evaluate(with: emailTextField.text) == false
            {
                let alert = UIAlertController(title: "Information", message: "Please enter valid email id.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alert.addAction(ok)
                alert.addAction(cancel)
                
                self.present(alert, animated: true, completion: nil)
            }
            break
        case passwordTextField:
            break
        case confirmPasswordTextField:
            if confirmPasswordTextField.text! != (passwordTextField.text!) {
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
