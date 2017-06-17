//
//  PathViewController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit
import CoreData

class PathViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    //MARK: - Properties 
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - UI Actions 
    
    @IBAction func addPathButtonTapped(_ sender: Any) {
    }
    
    
    
    //MARK: - View Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
        
        let fetchRequest: NSFetchRequest<Path> = Path.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            NSLog("Error performing fecth request: \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.pathCellIdentifier, for: indexPath) as? PathTableViewCell else { return PathTableViewCell() }
        
        guard let paths = fetchedResultsController.fetchedObjects else { return cell }
        
        let path = paths[indexPath.row]
        cell.layer.cornerRadius = 4
        cell.clipsToBounds = true 
        
        cell.path = path
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    //MARK: - Fetched Results Delegates 
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .fade)
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath,
                let newIndexPath = newIndexPath else { return }
            tableView.moveRow(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - Helpers 
    
    func setAppearance() {
        self.view.backgroundColor = UIColor.lightGray
        self.tableView.backgroundColor = .clear 
    }
    
    
    //MARK: - Fetched Results Properties 
    
    var fetchedResultsController: NSFetchedResultsController<Path>!
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Keys.toFearDetail,
            let indexPath = tableView.indexPathForSelectedRow {
            let path = PathController.shared.paths[indexPath.row]
            let fearVC = segue.destination as? FearsViewController
            fearVC?.path = path
        }
        
        
    }
}















