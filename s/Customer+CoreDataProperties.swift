//
//  Customer+CoreDataProperties.swift
//  
//
//  Created by SOLUTIONPLANETS on 06/09/18.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var pincode: String?
    @NSManaged public var tickets: NSOrderedSet?

}

// MARK: Generated accessors for tickets
extension Customer {

    @objc(insertObject:inTicketsAtIndex:)
    @NSManaged public func insertIntoTickets(_ value: BookedTickets, at idx: Int)

    @objc(removeObjectFromTicketsAtIndex:)
    @NSManaged public func removeFromTickets(at idx: Int)

    @objc(insertTickets:atIndexes:)
    @NSManaged public func insertIntoTickets(_ values: [BookedTickets], at indexes: NSIndexSet)

    @objc(removeTicketsAtIndexes:)
    @NSManaged public func removeFromTickets(at indexes: NSIndexSet)

    @objc(replaceObjectInTicketsAtIndex:withObject:)
    @NSManaged public func replaceTickets(at idx: Int, with value: BookedTickets)

    @objc(replaceTicketsAtIndexes:withTickets:)
    @NSManaged public func replaceTickets(at indexes: NSIndexSet, with values: [BookedTickets])

    @objc(addTicketsObject:)
    @NSManaged public func addToTickets(_ value: BookedTickets)

    @objc(removeTicketsObject:)
    @NSManaged public func removeFromTickets(_ value: BookedTickets)

    @objc(addTickets:)
    @NSManaged public func addToTickets(_ values: NSOrderedSet)

    @objc(removeTickets:)
    @NSManaged public func removeFromTickets(_ values: NSOrderedSet)

}
