//
//  ProjectCell.swift
//  AEVlist
//
//  Created by Dieter Bergmann on 15.11.18.
//  Copyright © 2018 Dieter Bergmann. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet weak var softwareCycle: UILabel!
    @IBOutlet weak var projectName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
