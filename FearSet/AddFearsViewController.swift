//
//  AddFearsViewController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/18/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit
import CoreData

class AddFearsViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var mainCardViewBg: UIView!
    @IBOutlet weak var decisionTitleLabel: UILabel!
    @IBOutlet weak var reasonTextField: UITextField!
    
    var fetchedResultsController: NSFetchedResultsController<Fear>!
    
    var decision: Path? {
        didSet {
            configureFetchedResults()
        }
    }

    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let decision = decision,
            let fear = reasonTextField.text,
            !fear.isEmpty else { return }
        FearController.create(FearWithName: fear, shouldDo: false, value: 0, path: decision)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.blue3
        mainCardViewBg.backgroundColor = .white
        mainCardViewBg.layer.cornerRadius = 6
        mainCardViewBg.clipsToBounds = true
        
        // clear navbar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    //MARK: - Private 
    
    private func configureFetchedResults() {
        
        guard let decision = decision else { return }
        
        if fetchedResultsController == nil {
            let fetchRequest: NSFetchRequest<Fear> = Fear.fetchRequest()
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
            fetchedResultsController.delegate = self
        }
        
        let fetchRequest: NSFetchRequest<Fear> = Fear.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "fear == %@", decision)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            NSLog("Error performing fetch request: \(error)")
        }
    }

}






















