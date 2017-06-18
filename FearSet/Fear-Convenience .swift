//
//  Fear-Convenience .swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import Foundation
import CoreData

extension Fear {
    
    @discardableResult convenience init(name: String, value: Int = 0, decision: Decision, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.name = name
        self.decision = decision
        
    }
}
