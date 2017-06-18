//
//  DecisionController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import Foundation
import CoreData

class DecisionController {
    
    //MARK: - Properties
    
    static let shared = DecisionController()
    
    var decisions: [Decision] {
        let request: NSFetchRequest<Decision> = Decision.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    
    //MARK: - CRUD 
    
    func create(DecisionWithName name: String) {
        Decision(name: name)
        saveToPersistentStorage()
    }
    
    func delete(_ decision: Decision) {
        if let moc = decision.managedObjectContext {
            moc.delete(decision)
            saveToPersistentStorage()
        }
    }
    
    func saveToPersistentStorage() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print("There was an error saving to CoreData: \(error)")
        }
    }
}
