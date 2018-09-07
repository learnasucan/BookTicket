//
//  BookHistoryVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 29/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData

class BookHistoryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tickets: [BookedTickets]? {
        didSet{
            tableView.reloadData()
        }
    }
    var users: [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        self.fetch { (complete) in
            if complete {
                guard  let tickets = tickets else {
                    return
                }
                if (tickets.count) >= 1 {
                    //tableView.isHidden = false
                    print(tickets as Any)
                } else {
                    return
                }
                
            } else {
                //tableView.isHidden = true
            }
        }//Fetch Complete
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch(completion: (_ complete : Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest1 = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        let fetchRequest2 = NSFetchRequest<NSFetchRequestResult>(entityName: "BookedTickets")
        
        do {
            users = try managedContext.fetch(fetchRequest1) as! [Customer]
            
            tickets = try ((managedContext.fetch(fetchRequest2) as? [BookedTickets]))
            print("Succesfully Fetched")
            tableView.reloadData()
            completion(true)
        } catch  {
            debugPrint("Could Not Fetch:\(error.localizedDescription)")
            completion(false)
        }
        
        
    }
    
}

extension BookHistoryVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let tickets = tickets else {
            return 0
        }
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookHistoryVCCell", for: indexPath) as? BookHistoryVCCell else { return UITableViewCell()}
        
        guard  let tickets = tickets else {
            return UITableViewCell()
        }
        
        let ticket = tickets[indexPath.row]
        cell.configureCell(ticket: ticket)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
}
