//
//  PathTableViewCell.swift
//  FearSet
//
//  Created by Andrew Ervin Gierke on 6/17/17.
//  Copyright © 2017 And. All rights reserved.
//

import UIKit

class PathTableViewCell: UITableViewCell {
    
    //MARK: - Properties 
    
    @IBOutlet weak var pathNameLabel: UILabel!
    
    var path: Path? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        
        pathNameLabel.text = path?.name

    }
    
}
