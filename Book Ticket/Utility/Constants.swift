//
//  Constants.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 28/08/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit
import CoreData
//typealias Picker = UIPickerViewDelegate & UIPickerViewDataSource


let appDelegate = UIApplication.shared.delegate as? AppDelegate
let email_reg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
let mobile_reg = "[0-9]{10}"
let pin_reg = "[0-9]{6}"
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

struct UserDefaultsKey {
    static let UserId = "userId"
    static let UserName = "username"
    static let Name = "name"
    static let UserLoginStatusFlag = "userloginstatus"
    static let RemeberMeDefaults = "remebermedefaults"
    static let APNSTokenKey = "APNSTokenKey"
    static let EditButtonClickValidateUser = "editButtonClick"
    static let KeyboardHeight = "keyboardHeight"
    static let UserDetails = "userDetails"
    static let SearchUserResponse = "searchUserResponse"
}

struct Message {
    static let EmailError = "Please provide a valid email address"
    static let PasswordError = "Please provide your Password"
    static let DateError = "Please provide a valid Date"
    static let rangeError = "Please use between 5 to 20 characters."
    static let EmptyFieldError = "Please fill out this field."
    static let UserNameError = "Please enter a username"
    static let MobileError = "Please enter a valid mobile number"
    static let PincodeError = "Please enter a valid pincode number"
    static let UserDetails = "userDetails"
    static let SearchUserResponse = "searchUserResponse"
}



