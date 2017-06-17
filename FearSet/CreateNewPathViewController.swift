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
    
    
    //MARK: - UI Actions 
    
    @IBAction func createPathButtonTapped(_ sender: Any) {
        guard let pathName = enterNameTextField.text,
            !pathName.isEmpty else { return }
        
        PathController.shared.create(pathWithName: pathName)
        enterNameTextField.text = ""
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - View Lifecycle 
    
    

}
