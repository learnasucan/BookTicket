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
    var components = DateComponents()
    
    //ToolBar
    
    let dateToolBar : UIToolbar = {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        return toolbar
    } ()
    
    let pickerToolBar : UIToolbar = {
        
        let toolbar = UIToolbar()
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
        
        //Set navigation name
        self.navigationItem.title = "Booking"
        
        // Input data into the Array:
        cities = ["Mumbai","Pune","Delhi","Jaipur","Navi Mumbai","AMD","Noida"]
        
        showDatePicker()
        createPicker()
        setMinMaxDate()
        
    }
    
    func setMinMaxDate()  {
        
        components.year = 0
        let minDate = Calendar.current.date(byAdding: components, to: Date())
        
        components.year = 2 // 2 years of booking
        let maxDate = Calendar.current.date(byAdding: components, to: Date())
        
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
    }
    
    func showDatePicker(){
        //Formate Date
        
        datePicker.datePickerMode = .date
        inputTextField.inputAccessoryView = dateToolBar
        inputTextField.inputView = datePicker
    }
    
    func createPicker () {
        
        let picker = UIPickerView()
        picker.delegate = self
        
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
        self.view.endEditing(true)
    }
    
    @objc func cancelPicker(){
        self.view.endEditing(true)
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
        
        return cities[row]
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


extension BookTicketVC: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        switch textField {
        case inputTextField:
            Utilities.emptyFieldValidate(textField: inputTextField, view: self)
            break
            
        case fromTextField:
            Utilities.emptyFieldValidate(textField: fromTextField, view: self)
            break
            
        case ToTextField:
            Utilities.emptyFieldValidate(textField: ToTextField, view: self)
            break
        case numerPassangerTextField:
            Utilities.emptyFieldValidate(textField: numerPassangerTextField, view: self)
            break
            
        default:
            print("Wrong Typed")
            break
        }
    }
    
    //    func setupAddTargetIsNotEmptyTextFields() {
    //        self.saveButton.isEnabled = false //hidden okButton
    //        inputTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty),
    //                                   for: .editingChanged)
    //        fromTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty),
    //                                    for: .editingChanged)
    //        ToTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty),
    //                                for: .editingChanged)
    //        numerPassangerTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty),
    //                                for: .editingChanged)
    //        
    //        
    //    }
    //    
    //    @objc func textFieldsIsNotEmpty(sender: UITextField) {
    //        
    //        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
    //        
    //        guard
    //            let bookDate = inputTextField.text, !bookDate.isEmpty,
    //            let from = fromTextField.text, !from.isEmpty,  let to = ToTextField.text, !to.isEmpty,
    //            let passanger = numerPassangerTextField.text, !passanger.isEmpty
    //            else {
    //                self.saveButton.isEnabled = false
    //                Utilities.alertWithoutButtonAction(alertTitle: "Alert", alertMessage: "Please Fill All Fields", messageOnButton: "Ok", passViewController: self)
    //                return
    //        }
    //        // enable okButton if all conditions are met
    //        saveButton.isEnabled = true
    //    }
}
