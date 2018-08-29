//
//  BookTicketVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 27/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

class BookTicketVC: UIViewController,UIPickerViewDelegate,UIPicker {
    
    //MARK:IBOutlets and Variables
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var ToTextField: UITextField!
    @IBOutlet weak var numerPassangerTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    
    let datePicker = UIDatePicker()
    
    var cities = ["Mumbai","Pune","Delhi","Jaipur","Navi Mumbai","AMD","Noida"]
    //MARK:Button Actions
    
    @IBAction func tapOnSave(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        
    }
    
    func showDatePicker(){
        //Formate Date
        
        datePicker.datePickerMode = .date
        
        //ToolBar
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
    toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        inputTextField.inputAccessoryView = toolbar
        inputTextField.inputView = datePicker
        
    }
    
    @objc func doneDatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        inputTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


