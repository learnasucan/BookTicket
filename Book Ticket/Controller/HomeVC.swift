//
//  HomeVC.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 27/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    //---------------------------
    //MARK:IBOutlets and Variables
    //----------------------------
    
    @IBOutlet weak var bookTicketButton: UIButton!
    @IBOutlet weak var bookHistoryButton: UIButton!
    
    //---------------------------
    //MARK:Button Actions
    //----------------------------
    
    @IBAction func tapOnTicket(_ sender: UIButton) {
        
//        performSegue(withIdentifier: "BookTicketVC", sender: self)
    }
    
    
    @IBAction func tapOnHistory(_ sender: UIButton) {
        
//        performSegue(withIdentifier: "BookHistoryVC", sender: self)
    }
    
    //Mandatory to unwind
    @IBAction func unwindToBookVC(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set navigation name
        self.navigationItem.title = "Home"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
