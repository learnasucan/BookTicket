//
//  BookDetailsModel.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 01/09/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

struct BookDetailsModel: Codable {
    let date: String?
    let fromLocation: String?
    let toLocation: String?
    let passanger: Int?
    let name: String?
    let age: Int?
    let ticketId: String?

}
