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
    
    static let shared = SolutionController()
    
    func create(solutionWith text: String, value: Float = 0, fear: Fear) {
        let _ = Solution(text: text, value: value, fear: fear)
        DecisionController.shared.saveToPersistentStorage()
    }
    
    func delete(solution: Solution) {
        if let moc = solution.managedObjectContext {
            moc.delete(solution)
            DecisionController.shared.saveToPersistentStorage()
        }
    }
}
