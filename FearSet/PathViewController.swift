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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PathController.shared.paths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.pathCellIdentifier, for: indexPath) as? PathTableViewCell else { return PathTableViewCell() }
        
        let path = PathController.shared.paths[indexPath.row]
        
        cell.path = path
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
