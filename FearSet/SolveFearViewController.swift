//
//  SolveFearViewController.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/18/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class SolveFearViewController: UIViewController {
    
    //MARK: - Properties 
    
    var decisionName: String?
    var decisionValue: Float?
    var fearName: String?
    var fearValue: Float?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainViewBg: UIView!
    @IBOutlet weak var solutionTextField: UITextField!
    
    @IBOutlet weak var subHeadingLabel: UILabel!
    @IBOutlet weak var sliderHeadingLabel: UILabel!
    

    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = fearName
        titleLabel.textColor = Colors.aquaGreen
        
        subHeadingLabel.textColor = Colors.blue3
        sliderHeadingLabel.textColor = Colors.blue3
        
        self.title = "\(decisionName)"
        
    }
    

}








