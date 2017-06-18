//
//  Solution+Convenience.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/18/17.
//  Copyright © 2017 And. All rights reserved.
//

import Foundation
import CoreData

extension Solution {
    
    @discardableResult convenience init(text: String, value: Int, fear: Fear, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.text = text
        self.value = value
        self.fear = fear
        
    }
    
}
