//
//  BookHistoryVCCell.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 04/09/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

class BookHistoryVCCell: UITableViewCell {
    
    @IBOutlet weak var bookerNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var passangerNameLabel: UILabel!
    @IBOutlet weak var ticketNumberLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    var jsonNamesArr: [Any] = []
    var jsonAgesArr: [Any] = []
    var details = ""
    
    func configureCell(ticket: BookedTickets) {
        
        let fullNames: String  = ticket.passangerName!
        let dataNameArray = fullNames.data(using: .utf8)
        let fullAges: String = ticket.age!
        let dataAgeArray = fullAges.data(using: .utf8)
        
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
        
        self.bookerNameLabel.text! = Utilities.getUserName()
        //self.ageLabel.text! = "Ages: \(ticket.age!)"
        self.passangerNameLabel.text! = "Passangers Details:\n\(details)" 
        self.fromLabel.text! = "From: \(ticket.fromDestination!)"
        self.toLabel.text! = "To: \(ticket.toDestination!)"
        self.createdLabel.text! = "Booked Date: \(ticket.created_at!)"
        self.ticketNumberLabel.text! = "Ticket Number: \(ticket.uniqueTicketNumber!)"
    }
    
    
}
