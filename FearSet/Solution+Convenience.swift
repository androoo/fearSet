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
    
    convenience init(text: String, value: Float = 0, fear: Fear, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.text = text
        self.fear = fear
        
    }
    
}
