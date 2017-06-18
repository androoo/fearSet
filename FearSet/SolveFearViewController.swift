//
//  SolveFearViewController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/18/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class SolveFearViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainViewBg: UIView!
    @IBOutlet weak var solutionTextField: UITextField!

    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let pathName = enterNameTextField.text,
            !pathName.isEmpty else { return }
        
        PathController.shared.create(pathWithName: pathName)
        enterNameTextField.text = ""
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
