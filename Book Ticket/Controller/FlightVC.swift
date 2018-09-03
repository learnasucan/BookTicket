//
//  FlightVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 02/09/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData

class FlightVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var flights = ["Mumbai Flights\t3AM\t₹2000",
                   "Ahamadabad Flights\t5AM\t₹3000",
                   "Kerla Flights\t6AM\t₹2000",
                   "Dubai Flights\t6.30AM\t₹2000",
                   "Maskat Flights\t7AM\t₹2000"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}

extension FlightVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlightVCCell", for: indexPath ) as? FlightVCCell else { return  UITableViewCell() }
        
        cell.labelFlights.text! = flights[indexPath.row]

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TicketDetailsVC", sender: flights[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TicketDetailsVC" {
            let vc = segue.destination as? TicketDetailsVC
            vc?.myFlight = sender as? String
        }
    }
}
