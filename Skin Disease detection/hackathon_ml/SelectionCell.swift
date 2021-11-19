//
//  SelectionCell.swift
//  hackathon_ml
//
//  Created by philips on 12/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import UIKit

class SelectionCell: UITableViewCell{
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}


