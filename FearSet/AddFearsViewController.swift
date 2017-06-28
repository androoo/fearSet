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
    
    //MARK: - Properties

    @IBOutlet weak var mainCardViewBg: UIView!
    @IBOutlet weak var decisionTitleLabel: UILabel!
    @IBOutlet weak var reasonTextField: UITextField!
    
    @IBOutlet weak var fearValueSlider: UISlider!
    
    var decisionName: String?
    var decisionValue: Float?
    
    var decision: Decision?
    
    //MARK: - UI Action s
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decisionTitleLabel.text = decision?.name
        decisionTitleLabel.textColor = Colors.redOrange
        
        // clear navbar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Keys.toAddSolutions {
            
            guard let decision = self.decision,
                let fearText = reasonTextField.text,
                !fearText.isEmpty else {
                    return
            }
            
            let addSolutionVC = segue.destination as? SolveFearViewController
            
            let fear = FearController.shared.create(FearWithName: fearText, value: fearValueSlider.value, decision: decision)
            
            addSolutionVC?.fear = fear 
            
            
        }
    }

}






















