//
//  FundamentModel.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 28/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FundamentModel {
    public static let shared = FundamentModel()

    public var lastPosition: Int = 0
    public var clickedButtons: [Int] = []
    
    let appDelegate: AppDelegate
    let context: NSManagedObjectContext
    let entity: NSEntityDescription?
    let newUser: NSManagedObject

    private init() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Fundaments", in: context)
        newUser = NSManagedObject(entity: entity!, insertInto: context)
    }
    
    public func savePositionAndClicked(){
        newUser.setValue(lastPosition, forKey: "elephantposition")
        
        do {
           try context.save()
          } catch {
           print("Failed saving")
        }
    }
    
    public func getPositionAndClicked(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Fundaments")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                lastPosition = data.value(forKey: "elephantposition") as! Int
            }
        } catch {
            print("Failed")
        }
    }
    
}
