//
//  FearsViewController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit
import CoreData

class FearsViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    //MARK: - Properties 
    
    @IBOutlet weak var addFearTextField: UITextField!
    
    var fetchedResultsController: NSFetchedResultsController<Fear>!
    
    var path: Path? {
        didSet {
            configureFetchedResultsController()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return path?.fears?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Keys.fearCellIdentifier, for: indexPath)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: - Private 
    
    private func configureFetchedResultsController() {
        
        guard let path = path else { return }
        
        if fetchedResultsController == nil {
            
            let fetchRequest: NSFetchRequest<Fear> = Fear.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "fears", cacheName: nil)
            
            fetchedResultsController.delegate = self
        }
        
        let fetchRequest: NSFetchRequest<Fear> = Fear.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "path == %@", path)
            
            do {
                try fetchedResultsController.performFetch()
            } catch {
                NSLog("Error performing fetch request: \(error)")
            }
        
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}




















