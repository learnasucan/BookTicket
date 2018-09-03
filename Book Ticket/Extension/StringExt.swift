//
//  StringExt.swift
//  Book Ticket
//
//  Created by SOLUTIONPLANETS on 02/09/18.
//  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
//

import UIKit

extension String {
    
    static func random(length: Int = 20) -> String {
        
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var randomString: String = ""
        
        for _ in 0..<length {
            
            let randomValue = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(randomValue))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
