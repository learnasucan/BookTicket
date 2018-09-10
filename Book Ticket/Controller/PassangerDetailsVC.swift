//
//  PassangerDetailsVC.swift
//  Book Ticket
//
//  Created by APPLE on 30/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData

class PassangerDetailsVC: UIViewController {
    
    //-----------------------------
    //MARK: IBOutlets and Variables
    //-----------------------------
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveDetailsButton: UIButton!
    
    var bookingDate: String?
    var from: String?
    var to: String?
    var passangers:Int? // It decides number of cells
    var ticketId:String = ""
    var CollectionOfCell = [PassangerDetailsVCCell]()
    var names = [String]()
    var age = [String]()
    var createdAt = ""
    var passData = [String:Any] ()
    var jsonNamesArr: [Any] = []
    var jsonAgesArr: [Any] = []
    var details = ""
    
    var tickets: [BookedTickets] = []
    //    var ticketsNew: [BookedTickets] = []
    
    @IBAction func tapOnSaveDetails(_ sender: UIButton) {
        //TODO:
        
        CollectionOfCell.forEach { cell in
            names.append(cell.nameTextField.text!)
            age.append(cell.ageTextField.text!)
        }
        
        self.save { (complete) in
            if complete {
                dismiss(animated: true, completion: nil)
            }
        }
        
        print(names)
        print(age)
        
        defer {
            
            Utilities.showAlertWithCancel(alertTitle: "Alert", alertMessage: "Do you want to confirm Ticket?", cancelTitle: "Cancel", requiredActionTitle: "Ok", passViewController: self) { (flag) in
                
                if flag == true {
                    self.performSegue(withIdentifier: "FlightVC", sender: sender)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set navigation name
        self.navigationItem.title = "Fill Details"
    }
    
    
    func save(completion: (_ finished: Bool) -> () ){
        
        guard  let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let ticket = BookedTickets(context: managedContext)
        
        // Array of Strings
        
        let stringyfyNames = Utilities.stringify(json: names)
        print(stringyfyNames)
        
        let stringyfyAges = Utilities.stringify(json: age)
//        let dataArray = stringyfyAges.data(using: .utf8)
        let dataNameArray = stringyfyNames.data(using: .utf8)
        let dataAgeArray = stringyfyAges.data(using: .utf8)
        
        do {
            if let jsonNameArray = try JSONSerialization.jsonObject(with: dataNameArray!, options: .allowFragments) as? [Any] {
                jsonNamesArr = jsonNameArray
                print(jsonNameArray)
            }
        } catch {
            //            #error()
            print("Error")
        }
        
        do {
            if let jsonAgeArray = try JSONSerialization.jsonObject(with: dataAgeArray!, options: .allowFragments) as? [Any] {
                jsonAgesArr = jsonAgeArray
                print(jsonAgeArray)
            }
        } catch {
            print("Error")
        }
        
        for (name, age) in zip(jsonNamesArr, jsonAgesArr) {
            details = details + ("\(name) of \(age)\n")
            print("\(name): \(age)")
        }
        
        passData = ["name": details,
                    "email": Utilities.getUserEmail(),
                    "mobile":Utilities.getUserMobile(),
                    "bookingDate":bookingDate!,
                    "fromLocation":from!,
                    "toLocation":to!,
                    "createdAt":createdAt]
        
        
        createdAt = Utilities.getCurrentTimeStamp()
        ticket.customerName = Utilities.getUserName()
        ticket.passangerName = stringyfyNames
        //print(stringName)
        ticket.age = stringyfyAges
        //print(stringAge)
        ticket.dateOfJourney = bookingDate!
        print(bookingDate!)
        ticket.fromDestination = from!
        print(from!)
        ticket.toDestination = to!
        print(to!)
        let ticketNumber = String.random()
        ticket.uniqueTicketNumber = ticketNumber
        print(String.random())
        ticket.created_at = createdAt
        //Singleton 
        Singleton.user.addToTickets(ticket)
        print(createdAt)
        
        do {
            try  managedContext.save()
            print("Succesfully saved.")
            completion(true)
        } catch  {
            debugPrint("Could not save\(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FlightVC" {
            let vc = segue.destination as? FlightVC
            vc?.passData = passData
        }
    }
    
}

extension PassangerDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passangers ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowIndex:Int = indexPath.row + 1
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PassangerDetailsVCCell", for: indexPath) as? PassangerDetailsVCCell else { return  UITableViewCell()
        }
        cell.rowCount.text! = String(rowIndex)
        cell.configureCell()
        CollectionOfCell.append(cell)
        return cell
    }
    
}

