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
    
    //MARK: - UI Action s
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.blue3
        mainCardViewBg.backgroundColor = .white
        mainCardViewBg.layer.cornerRadius = 6
        mainCardViewBg.clipsToBounds = true
        
        decisionTitleLabel.text = decisionName
        decisionTitleLabel.textColor = Colors.redOrange
        
        // clear navbar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Keys.toAddSolutions {
            
            guard let decision = decisionName,
                !decision.isEmpty,
                let decisionValue = decisionValue,
                let fearText = reasonTextField.text,
                !fearText.isEmpty else { return }
            
            let addSolutionVC = segue.destination as? SolveFearViewController
            
            addSolutionVC?.decisionName = decision
            addSolutionVC?.decisionValue = decisionValue
            addSolutionVC?.fearName = fearText
            addSolutionVC?.fearValue = fearValueSlider.value
            
        }
    }

}






















