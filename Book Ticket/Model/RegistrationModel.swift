//
//  RegistrationModel.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 30/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

struct RegistrationModel: Codable {
    let name: String?
    let address: String?
    let pincode: String?
    let mobile: String?
    let email: String?
    let password: String?
}
