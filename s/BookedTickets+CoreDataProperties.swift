//
//  BookedTickets+CoreDataProperties.swift
//  
//
//  Created by SOLUTIONPLANETS on 06/09/18.
//
//

import Foundation
import CoreData


extension BookedTickets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookedTickets> {
        return NSFetchRequest<BookedTickets>(entityName: "BookedTickets")
    }

    @NSManaged public var age: String?
    @NSManaged public var created_at: String?
    @NSManaged public var dateOfJourney: String?
    @NSManaged public var fromDestination: String?
    @NSManaged public var passangerName: String?
    @NSManaged public var toDestination: String?
    @NSManaged public var uniqueTicketNumber: String?
    @NSManaged public var customer: Customer?

}
