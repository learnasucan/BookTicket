////
////  CoreDataHandler.swift
////  Book Ticket
////
////  Created by SOLUTIONPLANETS on 28/08/18.
////  Copyright © 2018 SOLUTIONPLANETS. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class CoreDataHandler: NSObject {
//    
//    private class func getContext() -> NSManagedObjectContext
//    {
//        let delegate = UIApplication.shared.delegate as? AppDelegate
//        
//        return (delegate?.persistentContainer.viewContext)!
//    }
//    
//    
//    class func saveObeject (name:String,address:String,pincode:String,mobile:String,email:String,password:String)
//    {
//        let context =  getContext()
//        let entity = NSEntityDescription.entity(forEntityName: "Customer", in: context)
//        
//        let manageObjet = NSManagedObject(entity: entity!, insertInto: context)
//        
//        manageObjet.setValue(name, forKey: "name")
//        manageObjet.setValue(address, forKey: "address")
//        manageObjet.setValue(pincode, forKey: "pincode")
//        manageObjet.setValue(mobile, forKey: "mobile")
//        manageObjet.setValue(email, forKey: "email")
//        manageObjet.setValue(password, forKey: "password")
//        
//        
//        do { try context.save()
//        }
//        catch {
//            print("unable to save data")
//        }
//    }
//    
//    class func getCustomerDetail(name:String) -> [Customer]?
//    {
//        
//        // return "http://1.bp.blogspot.com/-J9emWhBZ_OM/TtQgVQmBHRI/AAAAAAAAD2w/j7JJMRMiuAU/s1600/Al_Ain_FC.png"
//        let contecxt = getContext()
//        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
//        
//        var customer:[Customer] = []
//        let predicate = NSPredicate(format: "name LIKE[cd] %@",name)
//        fetchRequest.predicate = predicate
//        do{
//            customer =  try contecxt.fetch(fetchRequest)
//            return (customer)
//        }catch
//        {
//            return nil
//            
//        }
//        
//    }
//    
//    
//    class func deleteObject(user:Customer) ->Bool{
//        let context = getContext()
//        context.delete(user)
//        do
//        {
//            try context.save()
//            return true
//        }catch{
//            return false
//        }
//    }
//    
//    //Clean delete
//    
//    class func cleanDelete () ->Bool
//    {
//        let context = getContext()
//        let delete = NSBatchDeleteRequest(fetchRequest: Customer.fetchRequest())
//        
//        do{
//            try context.execute(delete)
//            return true
//        }catch
//        {
//            return false
//        }
//    }
//    
//}
