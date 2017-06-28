//
//  FearController .swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import Foundation
import CoreData

class FearController {
    
    static let shared = FearController() 
    
    func create(FearWithName name: String, value: Float = 0, decision: Decision) -> Fear {
        let fear = Fear(name: name, decision: decision)
        DecisionController.shared.saveToPersistentStorage()
        return fear
    }
    
    func delete(fear: Fear) {
        if let moc = fear.managedObjectContext {
            moc.delete(fear)
            DecisionController.shared.saveToPersistentStorage()
        }
    }
}
