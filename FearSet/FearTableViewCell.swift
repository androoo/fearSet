//
//  FearTableViewCell.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class FearTableViewCell: UITableViewCell {
    
    //MARK: - Properties 
    
    @IBOutlet weak var fearLabel: UILabel!
    
    var fear: Fear? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let fear = fear else { return }
        fearLabel.text = fear.name
    }

}
