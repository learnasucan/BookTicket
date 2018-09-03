//
//  TicketDetailsVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 02/09/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData

class TicketDetailsVC: UIViewController {
    
    @IBOutlet weak var ticketDetailsLabel: UILabel!
    
    @IBOutlet weak var userDetailsLabel: UILabel!
    
    var ticketsNew: [BookedTickets] = []
    var users: [Customer] = []
    var myFlight: String?
    var nameArray: [[String]] = []
    var ageArray: [[String]] = []
    var details : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let myFlight = myFlight else {return}
        ticketDetailsLabel.text! = myFlight
        self.navigationItem.title = "Ticket"
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetch { (complete) in
            if complete {
                if ticketsNew.count >= 1 {
                    //tableView.isHidden = false
                    print(ticketsNew)
                    var test = users[0]
                    print(test)
                    
                    var j = 0
                    if j < ticketsNew.count {
                        let names = ticketsNew[j].passangerName
                        let nameStringAsData = names?.data(using: String.Encoding.utf16)
                        let nameS = try! JSONDecoder().decode([String].self, from: nameStringAsData!)
                        nameArray.append(nameS)
                        
                        let ages = ticketsNew[j].age
                        let ageStringAsData = ages?.data(using: String.Encoding.utf16)
                        let ageS = try! JSONDecoder().decode([String].self, from: ageStringAsData!)
                        ageArray.append(ageS)
                        j = j + 1
                    } else {return}
                    
                  
                    print(nameArray)
                    
                   
                    print(ageArray)
                    
                    userDetailsLabel.text! = "\(UserDefaults.standard.getUserName())\t\(UserDefaults.standard.getUserMobile())\t\(UserDefaults.standard.getUserEmail())"
                    
                   // for (age,name) in ( ageArray,nameArray) {
                        
                    //}
                    var i = 0
                    print(nameArray.count)
                    print(nameArray[0].count)
                    if i < nameArray[0].count {
                        details = details + "Name: \(nameArray[i][0])\t Age\(ageArray[i][0])"
                        print(details)
                        i = i + 1
                    } else {return}
                    
                    
                   // for i in nameArray.count {
                      //
                   // }
                        ticketDetailsLabel.text! = details
                    
                } else {
                    //tableView.isHidden = true
                }
            }
        }
    }
    
    func fetch(completion: (_ complete : Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        let fetchRequest2 = NSFetchRequest<NSFetchRequestResult>(entityName: "BookedTickets")
        
        do {
            users = try managedContext.fetch(fetchRequest1) as! [Customer]
            ticketsNew = try managedContext.fetch(fetchRequest2) as! [BookedTickets]
            print("Succesfully Fetched")
            completion(true)
        } catch  {
            debugPrint("Could Not Fetch:\(error.localizedDescription)")
            completion(false)
        }
        
        
    }
    
    

    
}
