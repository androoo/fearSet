//
//  CreateNewPathViewController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class CreateNewPathViewController: UIViewController {
    
    //MARK: - Properties 
    
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var mainViewBg: UIView!
    @IBOutlet weak var decisionSlider: UISlider!
    
    //MARK: - UI Actions
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - View Lifecycle 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height: CGFloat = 45
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Keys.toAddFears {
            guard let decisionText = enterNameTextField.text,
                !decisionText.isEmpty else { return }
            
            let addFearVC = segue.destination as? AddFearsViewController
            
            let decision = DecisionController.shared.create(DecisionWithName: decisionText)
            
            addFearVC?.decision = decision
            addFearVC?.decisionValue = decisionSlider.value
            
        }
    }
}
