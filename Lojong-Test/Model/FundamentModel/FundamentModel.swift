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
    public var clickedButtons: [Bool]? = []
    
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
        
    public func getPositionAndClicked(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Fundaments")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                lastPosition = data.value(forKey: "position") as! Int
                let clickedRecept = data.value(forKey: "clickedButtons") as? String ?? "false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false, false,false,false,false,false,false,false,false,false,false,false,false"
                clickedButtons = clickedRecept.components(separatedBy: ",").map { (Bool($0) ?? false) }
            }
        } catch {
            print("Failed")
        }
    }
    
    func savePositionAndClicked(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Fundaments")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                var saveClickedInString = ""
                for num in 0...30{
                    if num == 30{
                        saveClickedInString.append(String(clickedButtons![num]))
                    } else {
                        saveClickedInString.append(String(clickedButtons![num]) + ",")
                    }
                }
                data.setValue(lastPosition, forKey: "position")
                data.setValue(saveClickedInString, forKey: "clickedButtons")
            }
            do{
                try context.save()
            } catch {
                print("Failed")
            }
        } catch {
            print("Failed")
        }
    }
    
}
