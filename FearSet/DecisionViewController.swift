//
//  DecisionViewController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit
import CoreData

class DecisionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    //MARK: - Properties 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var addDecisionButtonView: UIView!
    
    //MARK: - UI Actions 
    
    
    
    //MARK: - View Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
        
        self.view.backgroundColor = Colors.gray
        
        let fetchRequest: NSFetchRequest<Decision> = Decision.fetchRequest()
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
        
        guard let decisions = fetchedResultsController.fetchedObjects else { return cell }
        
        let decision = decisions[indexPath.row]
        
        cell.decision = decision
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if let decision = fetchedResultsController.fetchedObjects?[indexPath.row] {
                DecisionController.shared.delete(decision)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
        
//        navigationController?.isNavigationBarHidden = true 
        
        headerView.backgroundColor = Colors.orange
        
        self.view.backgroundColor = .white
        self.tableView.backgroundColor = .clear
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        self.tableView.separatorStyle = .none
        
        navigationController?.navigationBar.tintColor = .white
        
        self.addDecisionButtonView.layer.cornerRadius = 8
        self.addDecisionButtonView.clipsToBounds = true
        
    }
    
    
    //MARK: - Fetched Results Properties 
    
    var fetchedResultsController: NSFetchedResultsController<Decision>!
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Keys.toFearDetail,
            let indexPath = tableView.indexPathForSelectedRow {
            let decision = DecisionController.shared.decisions[indexPath.row]
            let fearVC = segue.destination as? FearsViewController
            fearVC?.decision = decision
        }
        
        
    }
}















