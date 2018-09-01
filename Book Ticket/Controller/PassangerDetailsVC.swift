//
//  PassangerDetailsVC.swift
//  Book Ticket
//
//  Created by APPLE on 30/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

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
    
   
    @IBAction func tapOnSaveDetails(_ sender: UIButton) {
        //TODO:
        
        CollectionOfCell.forEach { cell in
            names.append(cell.nameTextField.text!)
            age.append(cell.ageTextField.text!)
        }
        
        defer {
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
        self.navigationItem.title = "Passanger Details"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PassangerDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passangers ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowIndex:Int = indexPath.row + 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "PassangerDetailsVCCell", for: indexPath) as! PassangerDetailsVCCell
        cell.rowCount.text! = String(rowIndex)
        
        CollectionOfCell.append(cell)
        return cell
    }
    
}
