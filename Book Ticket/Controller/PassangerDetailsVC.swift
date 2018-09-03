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
    var timeStamp = ""
    
    var tickets: [BookedTickets] = []
    //    var ticketsNew: [BookedTickets] = []
    
    @IBAction func tapOnSaveDetails(_ sender: UIButton) {
        //TODO:
        
        CollectionOfCell.forEach { cell in
            names.append(cell.nameTextField.text!)
            
            age.append(cell.ageTextField.text!)
        }
        
        defer {
            
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
            
            print(names)
            print(age)
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
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    func save(completion: (_ finished: Bool) -> () ){
        guard  let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let ticket = BookedTickets(context: managedContext)
        
        // Array of Strings
        
        let namesArrayAsString: String = names.description
        let agesArrayAsString: String = age.description
        
        //retrival
        //let stringAsData = arrayAsString.data(using: String.Encoding.utf16)
        //let arrayBack: [String] = try! JSONDecoder().decode([String].self, from: stringAsData!)
        
        ticket.passangerName = namesArrayAsString
        
        ticket.age = agesArrayAsString
        
        ticket.dateOfJourney = bookingDate!
        ticket.fromDestination = from!
        ticket.toDestination = to!
        ticket.uniqueTicketNumber = String.random()
        
        do {
            try  managedContext.save()
            print("Succesfully saved.")
            completion(true)
            //            self.performSegue(withIdentifier: "TicketDetailsVC", sender: self)
        } catch  {
            debugPrint("Could not save\(error.localizedDescription)")
            completion(false)
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
        
        CollectionOfCell.append(cell)
        return cell
    }
    
}

extension PassangerDetailsVC {
    
}
