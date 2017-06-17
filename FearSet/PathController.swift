//
//  PathController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import Foundation
import CoreData

class PathController {
    
    //MARK: - Properties
    
    static let shared = PathController()
    
    var paths: [Path] {
        let request: NSFetchRequest<Path> = Path.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    
    //MARK: - CRUD 
    
    func create(pathWithName name: String) {
        Path(name: name)
    }
    
    func delete(_ path: Path) {
        if let moc = path.managedObjectContext {
            moc.delete(path)
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
