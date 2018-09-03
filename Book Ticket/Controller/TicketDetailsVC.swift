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
    var myFlight: String?
    var nameArray: [String] = []
    var ageArray: [String] = []
    
    
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
                    let names = ticketsNew[0].passangerName
                    let nameStringAsData = names?.data(using: String.Encoding.utf16)
                    nameArray = try! JSONDecoder().decode([String].self, from: nameStringAsData!)
                    print(nameArray)
                    
                    let ages = ticketsNew[0].age
                    let ageStringAsData = ages?.data(using: String.Encoding.utf16)
                    ageArray = try! JSONDecoder().decode([String].self, from: ageStringAsData!)
                    print(ageArray)
                    
                    userDetailsLabel.text! = "\(UserDefaults.standard.getUserName())\t\(UserDefaults.standard.getUserMobile())\t\(UserDefaults.standard.getUserEmail())"
                    ticketDetailsLabel.text! = ""
                    
                } else {
                    //tableView.isHidden = true
                }
            }
        }
    }
    
    func fetch(completion: (_ complete : Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BookedTickets")
        
        do {
            ticketsNew = try managedContext.fetch(fetchRequest) as! [BookedTickets]
            print("Succesfully Fetched")
            completion(true)
        } catch  {
            debugPrint("Could Not Fetch:\(error.localizedDescription)")
            completion(false)
        }
        
        
    }
    
    

    
}
