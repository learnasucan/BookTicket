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
    
    
    @IBOutlet weak var ticketDetailsLabel: UITextView!
    
    
    @IBOutlet weak var userDetailsLabel: UITextView!
    
    
    var ticketsNew: [BookedTickets] = []
    var users: [Customer] = []
    var myFlight: String = ""
    var nameArray: [String] = []
    var ageArray: [String] = []
    var details : String = ""
    var passData =  [String:Any] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //guard let myFlight = myFlight else {return}
        ticketDetailsLabel.text! = myFlight + "\n \(String(describing: passData["name"]))"
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
                    print(ticketsNew.count)
                    
                    print(ticketsNew)
                    if j < ticketsNew.count {
                        guard let fullNames = ticketsNew[j].passangerName else {return}
                        print(fullNames)
                        let fullNamesArr = fullNames.split(separator: " ")
                        
                        nameArray.append(String(fullNamesArr[j]))
                        
                        guard let fullAges = ticketsNew[j].age else {return}
                        let fullAgesArr = fullAges.split(separator: " ")
                        ageArray.append(String(fullAgesArr[j]))
                        print(nameArray)
                        print(ageArray)
                        
                        j = j + 1
                    } else {
                        return
                        
                    }
                    
                    
                    print(nameArray)
                    print(ageArray)
                    
                    userDetailsLabel.text! = "\(Utilities.getUserName())\n\(Utilities.getUserEmail())\n\(Utilities.getUserMobile())"
                    
                    var i = 0
                    print(nameArray.count)
                    print(nameArray.count)
                    if i < nameArray.count {
                        details = details + "Name: \(nameArray[i])\t Age\(ageArray[i])"
                        print(details)
                        i = i + 1
                    } else {return}
                    
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
