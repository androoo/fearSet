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
    
    static func create(FearWithName name: String, shouldDo: Bool, value: Int) {
        let _ = Fear(name: name, shouldDo: shouldDo, value: value)
        PathController.shared.saveToPersistentStorage()
    }
    
    static func delete(fear: Fear) {
        if let moc = fear.managedObjectContext {
            moc.delete(fear)
            PathController.shared.saveToPersistentStorage()
        }
    }
}
