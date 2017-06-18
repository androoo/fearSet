//
//  SolutionController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/18/17.
//  Copyright © 2017 And. All rights reserved.
//

import Foundation
import CoreData

class SolutionController {
    
    static func create(solutionWith text: String, value: Int = 0, fear: Fear) {
        let _ = Solution(text: text, fear: fear)
        DecisionController.shared.saveToPersistentStorage()
    }
    
    static func delete(solution: Solution) {
        if let moc = solution.managedObjectContext {
            moc.delete(solution)
            DecisionController.shared.saveToPersistentStorage()
        }
    }
}
