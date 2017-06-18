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
    
    static func create(FearWithName name: String, value: Int = 0, decision: Decision) {
        let _ = Fear(name: name, decision: decision)
        DecisionController.shared.saveToPersistentStorage()
    }
    
    static func delete(fear: Fear) {
        if let moc = fear.managedObjectContext {
            moc.delete(fear)
            DecisionController.shared.saveToPersistentStorage()
        }
    }
}
