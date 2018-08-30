//
//  BookTicketVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 27/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

class BookTicketVC: UIViewController{
    
    //MARK:IBOutlets and Variables
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var ToTextField: UITextField!
    @IBOutlet weak var numerPassangerTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let datePicker = UIDatePicker()
    
    var cities: [String] = [String] ()
    var selectedCity:String?
    
    //ToolBar
    
    let dateToolBar : UIToolbar = {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        return toolbar
    } ()
    
    let pickerToolBar : UIToolbar = {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        return toolbar
    } ()
    
    
    
    
    //MARK:Button Actions
    
    @IBAction func tapOnSave(_ sender: UIButton) {
//        performSegue(withIdentifier: "PassangerDetailsVC", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        createPicker()
        
        // Input data into the Array:
        cities = ["Mumbai","Pune","Delhi","Jaipur","Navi Mumbai","AMD","Noida"]
        
//        self.pickerView.delegate = self
//        self.pickerView.dataSource = self
       
       // show picker view when text field clicked
        
      
    }
    
    func showDatePicker(){
        //Formate Date
        
        datePicker.datePickerMode = .date
       /*
        //ToolBar
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        */
        inputTextField.inputAccessoryView = dateToolBar
        inputTextField.inputView = datePicker
        
    }
    
    
    func createPicker () {
        let picker = UIPickerView()
        picker.delegate = self
        
//        picker.dataSource = self
        
        self.fromTextField!.inputView = picker
        self.ToTextField!.inputView = picker
        
        
        fromTextField.inputAccessoryView = pickerToolBar
        ToTextField.inputAccessoryView = pickerToolBar
        
    }
    
    @objc func doneDatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        inputTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func donePicker(){
        
       
//        fromTextField.text = pickerView
        self.view.endEditing(true)
    }
    
    @objc func cancelPicker(){
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
     // MARK: - Navigation
     
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.destination is PassangerDetailsVC {
            let vc = segue.destination as? PassangerDetailsVC
            vc?.bookingDate = self.inputTextField.text
            vc?.from = self.fromTextField.text
            vc?.to = self.ToTextField.text
            vc?.passangers = Int(self.numerPassangerTextField.text!) ?? 0
        }
     }
 
    
}

extension BookTicketVC : UIPickerViewDelegate,UIPickerViewDataSource {
    
    // The number of columns of data
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
//        fromTextField.isSelected ?
//        if fromTextField.isSelected {
            return cities[row]
//        } else {
//            ToTextField.text! =
//            return cities[row]
//        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

         self.selectedCity =  cities[row]
        
        if ToTextField.isFirstResponder {
           
            self.ToTextField.text = selectedCity
            
        } else {
           
            self.fromTextField.text = selectedCity
        }
        
    }
    
}

